import 'package:flutter/material.dart';
import '../screens/tela_login.dart';
import 'componentes/custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ôxe Sushi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: CustomColors.colorAppTema,
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Login(),
    );
  }
}
