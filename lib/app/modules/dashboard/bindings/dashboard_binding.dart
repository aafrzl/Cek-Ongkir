import 'package:get/get.dart';
import 'package:ongkirapp/app/modules/home/controllers/home_controller.dart';
import 'package:ongkirapp/app/modules/profil/controllers/profil_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfilController>(() => ProfilController());
  }
}
