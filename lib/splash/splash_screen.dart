import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxesushi_v1/pages_routes/app_pages.dart';
import 'package:oxesushi_v1/widgets/widget_app_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(PagesRoutes.loginRoute);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey.shade500,
              Colors.grey.shade900,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adicione sua logo aqui
            Image.asset(
              'imagens/imagens_oxesushi/marcaDagua.png',
              width: 400,
              height: 400,
            ),
            const AppNameWidget(
              whiteTitleColor: Colors.black,
              textSize: 70,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
