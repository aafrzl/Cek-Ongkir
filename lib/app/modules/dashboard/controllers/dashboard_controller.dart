import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  FirebaseAuth auth = FirebaseAuth.instance;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
