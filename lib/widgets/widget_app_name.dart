import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../componentes/custom_colors.dart';

class AppNameWidget extends StatelessWidget {

  final Color? whiteTitleColor;
  final double textSize;


  const AppNameWidget({
    Key? key,
    this.textSize = 30,
    this.whiteTitleColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
            fontSize: textSize
        ),
        children: [
           TextSpan(
            text: "Ôxe",
            style: TextStyle(
              color: whiteTitleColor ?? Colors.white,
            ),
          ),
          TextSpan(
            text: "Sushi",
            // ignore: unnecessary_const
            style: TextStyle(
              color: CustomColors.colorAppVermelho,
            ),
          ),
        ],
      ),
    );
  }
}