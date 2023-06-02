import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const AppText(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize,
      this.fontWeight,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}