import 'package:flutter/material.dart';

class Sizer {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  // Getters for common use cases (Example)
  static double get width => screenWidth;
  static double get height => screenHeight;

  // Example usage: 20% of screen width
  static double wPercent(double percent) => screenWidth * (percent / 100);

  // Example usage: 10% of screen height
  static double hPercent(double percent) => screenHeight * (percent / 100);
}
