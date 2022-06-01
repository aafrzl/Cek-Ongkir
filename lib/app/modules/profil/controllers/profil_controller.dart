import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ProfilController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    yield* firestore.collection("users").doc(auth.currentUser!.uid).snapshots();
  }

  void logout() async {
    auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
