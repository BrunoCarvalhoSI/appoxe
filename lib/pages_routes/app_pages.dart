import 'package:get/get.dart';
import 'package:oxesushi_v1/screens/base/screen_base.dart';
import 'package:oxesushi_v1/screens/base/screen_home_tab.dart';
import 'package:oxesushi_v1/splash/splash_screen.dart';

import '../screens/screen_register_user.dart';
import '../screens/auth/screen_sign_in.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(page: () => const SplashScreen(), name: PagesRoutes.splashRoute),
    GetPage(page: () => const ScreenHome(), name: PagesRoutes.homeRoute),
    GetPage(page: () => const ScreenBase(), name: PagesRoutes.baseRoute),
    GetPage(page: () =>  Login(), name: PagesRoutes.loginRoute),
    GetPage(page: () => ScreenRegisterUser(), name: PagesRoutes.registerUserRoute)
  ];
}

abstract class PagesRoutes {
  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String baseRoute = '/';
  static const String loginRoute = '/login';
  static const String registerUserRoute = '/registerUser';
}
