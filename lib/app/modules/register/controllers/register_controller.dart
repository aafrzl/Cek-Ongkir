import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ongkirapp/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController nameC = TextEditingController();

  RxBool obsecure = true.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void obsecurePass() {
    if (obsecure.isFalse) {
      obsecure.value = true;
    } else {
      obsecure.value = false;
    }
  }

  Future<void> register() async {
    if (emailC.text.isNotEmpty) {
      try {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
                email: emailC.text, password: passC.text);

        if (userCredential.user != null) {
          firestore.collection("users").doc(auth.currentUser!.uid).set({
            "name": nameC.text,
            "email": emailC.text,
            "photoUrl": null,
            "createAt": DateTime.now().toIso8601String(),
          });
        }
        Get.offAllNamed(Routes.DASHBOARD);
        Get.snackbar(
          "Berhasil",
          "Selamat Datang ${auth.currentUser!.email}",
          snackPosition: SnackPosition.BOTTOM,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar("Terjadi Kesalahan", "Password terlalu singkat",
              snackPosition: SnackPosition.BOTTOM);
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
              "Terjadi Kesalahan", "Email sudah terdaftar, gunakan email lain",
              snackPosition: SnackPosition.BOTTOM);
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
              "Terjadi Kesalahan", "Password yang anda Admin masukkan salah!",
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar("Terjadi Kesalahan", "${e.code}",
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    }
  }
}
