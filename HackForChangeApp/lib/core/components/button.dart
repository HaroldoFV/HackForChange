import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/extension.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../fonts.dart';

class Buttons extends StatelessWidget {
  final VoidCallback? onPressed;
  final double height;
  final double width;
  final String text;
  final double textSize;
  final Color backgroundColorButton;
  final Color borderColorButton;
  final Color textColor;

  const Buttons({
    super.key,
    this.onPressed,
    this.width = 850,
    this.height = 65,
    this.backgroundColorButton = ColorsTheme.mainColor,
    this.borderColorButton = ColorsTheme.mainColor,
    this.textColor = ColorsTheme.white,
    required this.text,
    this.textSize = 17.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: backgroundColorButton,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColorButton,
              width: 2.5,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          minimumSize: Size(width.ws, height.hs),
        ),
        child: Text(
          text,
          style: FontStyles.i.poppinsMedium.copyWith(
            fontSize: textSize,
            color: textColor,
            //height: 0.05,
          ),
        ),
      ),
    );
  }
}
