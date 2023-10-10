import 'package:flutter/material.dart';

import '../../../componentes/custom_colors.dart';

class CategoriaTile extends StatelessWidget {
  CategoriaTile({
    Key? key,
    required this.categoria,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  String categoria;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 4
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Colors.white : Colors.transparent,
          ),
          child: Text(
            categoria,
            style: TextStyle(
              color: isSelected ? CustomColors.colorAppVermelho : Colors.white,
              fontSize: isSelected ? 16 : 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
