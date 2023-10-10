import 'package:flutter/material.dart';

const Map<int, Color> _swathOpacity = {
  50: Color.fromRGBO(0, 0, 0, .1),
  100: Color.fromRGBO(0, 0, 0, .2),
  200: Color.fromRGBO(0, 0, 0, .3),
  300: Color.fromRGBO(0, 0, 0, .4),
  400: Color.fromRGBO(0, 0, 0, .5),
  500: Color.fromRGBO(0, 0, 0, .6),
  600: Color.fromRGBO(0, 0, 0, .7),
  700: Color.fromRGBO(0, 0, 0, .8),
  800: Color.fromRGBO(0, 0, 0, .9),
  900: Color.fromRGBO(0, 0, 0, 1),
};
const Map<int, Color> _swathRedOpacity = {
  50: Color.fromRGBO(216, 62, 59, .1),
  100: Color.fromRGBO(216, 62, 59, .2),
  200: Color.fromRGBO(216, 62, 59, .3),
  300: Color.fromRGBO(216, 62, 59, .4),
  4000: Color.fromRGBO(216, 62, 59, .5),
  500: Color.fromRGBO(216, 62, 59, .6),
  600: Color.fromRGBO(216, 62, 59, .7),
  700: Color.fromRGBO(216, 62, 59, .8),
  800: Color.fromRGBO(216, 62, 59, .9),
  900: Color.fromRGBO(216, 62, 59, 1),
};
const Map<int, Color> _swathGreenOpacity = {
  50: Color.fromRGBO(2, 250, 35, 0.1),
  100: Color.fromRGBO(2, 250, 35, 0.2),
  200: Color.fromRGBO(2, 250, 35, 0.3),
  300: Color.fromRGBO(2, 250, 35, 0.4),
  4000: Color.fromRGBO(2, 250, 35, 0.5),
  500: Color.fromRGBO(2, 250, 35, 0.6),
  600: Color.fromRGBO(2, 250, 35, 0.7),
  700: Color.fromRGBO(2, 250, 35, 0.8),
  800: Color.fromRGBO(2, 250, 35, 0.9),
  900: Color.fromRGBO(2, 250, 35, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.red.shade700;

  static MaterialColor colorAppTema = const MaterialColor(
    0xFF0a0a0a,
    _swathOpacity,
  );
  static MaterialColor colorAppVermelho = const MaterialColor(
    0xFFd83e3b,
    _swathRedOpacity,
  );
  static MaterialColor colorAppVerde = const MaterialColor(
    0xFF289946,
    _swathGreenOpacity,
  );
}
