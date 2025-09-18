import 'package:flutter/material.dart';
import 'package:pranavdave/src/utils/sizer.dart';

class ResponsiveScreenProvider {
  static bool isMobileScreen(BuildContext context) => Sizer.screenWidth < 480;

  static bool isTabScreen(BuildContext context) =>
      Sizer.screenWidth > 480 && Sizer.screenWidth <= 820;

  static bool isDesktopScreen(BuildContext context) => Sizer.screenWidth > 820;
}
