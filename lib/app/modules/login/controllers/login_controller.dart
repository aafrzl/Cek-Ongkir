import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ongkirapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  RxBool obsecure = true.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  void obsecurePass() {
    if (obsecure.isFalse) {
      obsecure.value = true;
    } else {
      obsecure.value = false;
    }
  }

  //Login dengan email & password

  Future<void> login() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: emailC.text, password: passC.text);

        Get.offAllNamed(Routes.DASHBOARD);

        Get.snackbar("Login", "Selamat Datang ${auth.currentUser!.email}",
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar("Terjadi Kesalahan", "Email tidak terdaftar oleh Admin",
              snackStyle: SnackStyle.FLOATING,
              snackPosition: SnackPosition.BOTTOM);
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
              "Terjadi Kesalahan", "Password yang anda masukkan salah!",
              snackStyle: SnackStyle.FLOATING,
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (e) {
        Get.snackbar("Terjadi Kesalahan", "Tidak dapat login.",
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar(
          "Terjadi Kesalahan", "Email atau password tidak boleh kosong",
          snackStyle: SnackStyle.FLOATING, snackPosition: SnackPosition.BOTTOM);
    }
  }

  //Login dengan Akun Google
  void loginGoogle() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleAcc = await _googleSignIn.signIn();
      if (googleAcc != null) {
        print(googleAcc);

        final GoogleSignInAuthentication? googleAuth =
            await googleAcc.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        DocumentSnapshot documentSnapshot = await firestore
            .collection("users")
            .doc(auth.currentUser!.uid)
            .get();

        if (documentSnapshot.exists) {
          Get.offAllNamed(Routes.DASHBOARD);
          Get.snackbar("Login", "Selamat Datang ${auth.currentUser!.email}",
              snackStyle: SnackStyle.FLOATING,
              snackPosition: SnackPosition.BOTTOM);
        } else {
          firestore.collection("users").doc(auth.currentUser!.uid).set({
            "name": googleAcc.displayName,
            "email": googleAcc.email,
            "photoUrl": googleAcc.photoUrl,
            "createAt": DateTime.now().toIso8601String(),
          });
          Get.offAllNamed(Routes.DASHBOARD);

          Get.snackbar("Register", "Selamat Datang ${auth.currentUser!.email}",
              snackStyle: SnackStyle.FLOATING,
              snackPosition: SnackPosition.BOTTOM);
        }

        //Login ke dashboard
      } else {
        Get.snackbar(
          "Terjadi Kesalahan",
          "Belum memilih akun google",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (error) {
      print(error);
      Get.snackbar(
        "Terjadi Kesalahan",
        "Tidak bisa login dengan Akun Google.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
