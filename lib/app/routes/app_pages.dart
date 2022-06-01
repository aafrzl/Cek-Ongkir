import 'package:get/get.dart';

import 'package:ongkirapp/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:ongkirapp/app/modules/dashboard/views/dashboard_view.dart';
import 'package:ongkirapp/app/modules/home/bindings/home_binding.dart';
import 'package:ongkirapp/app/modules/home/views/home_view.dart';
import 'package:ongkirapp/app/modules/login/bindings/login_binding.dart';
import 'package:ongkirapp/app/modules/login/views/login_view.dart';
import 'package:ongkirapp/app/modules/profil/bindings/profil_binding.dart';
import 'package:ongkirapp/app/modules/profil/views/profil_view.dart';
import 'package:ongkirapp/app/modules/register/bindings/register_binding.dart';
import 'package:ongkirapp/app/modules/register/views/register_view.dart';
import 'package:ongkirapp/app/modules/splash/bindings/splash_binding.dart';
import 'package:ongkirapp/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
