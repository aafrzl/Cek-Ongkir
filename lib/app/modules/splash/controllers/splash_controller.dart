import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ongkirapp/app/routes/app_pages.dart';

class SplashController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  var isSignIn = false.obs;
  var connectionType = 0.obs;

  final Connectivity connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();

    getConnectionStatus();
  }

  @override
  void onReady() async {
    loading();
    super.onReady();
  }

  Future<void> getConnectionStatus() async {
    ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();

      getConnectionType(result);
    } catch (e) {
      print("Error Koneksivitas : ${e.toString()}");
      Get.snackbar("Terjadi Kesalahan", "Tidak dapat mencek koneksivitas",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void getConnectionType(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 1;
        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        break;
      default:
        Get.snackbar("Terjadi Kesalahan", "Tidak dapat mencek koneksi",
            snackPosition: SnackPosition.BOTTOM);
        break;
    }
  }

  Future<void> loading() async {
    Timer(Duration(seconds: 3), () {
      if (connectionType.value == 1) {
        if (auth.currentUser != null) {
          Get.offAllNamed(Routes.DASHBOARD);
        } else {
          Get.offAllNamed(Routes.LOGIN);
        }
      }
    });
  }
}
