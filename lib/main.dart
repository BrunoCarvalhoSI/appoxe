import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/pages/auth/controller/auth_controller.dart';
import 'src/pages_routes/app_pages.dart';
import 'src/componentes/custom_colors.dart';

void main() {
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ôxe Sushi',
      theme: ThemeData(
        primarySwatch: CustomColors.colorAppTema,
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
