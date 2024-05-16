import 'package:get/get.dart';
import '../pages/auth/view/screen_sign_in.dart';
import '../pages/base/screen_base.dart';
import '../pages/base/screen_home_tab.dart';
import '../pages/splash/screen_splash.dart';
import '../pages/usuario/screen_register_user.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(page: () => const SplashScreen(), name: PagesRoutes.splashRoute),
    GetPage(page: () => const ScreenHome(), name: PagesRoutes.homeRoute),
    GetPage(page: () => const ScreenBase(), name: PagesRoutes.baseRoute),
    GetPage(page: () => Login(), name: PagesRoutes.loginRoute),
    GetPage(
        page: () => ScreenRegisterUser(), name: PagesRoutes.registerUserRoute)
  ];
}

abstract class PagesRoutes {
  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String baseRoute = '/';
  static const String loginRoute = '/login';
  static const String registerUserRoute = '/registerUser';
}
