import 'package:flutter/material.dart';

class ResponsiveScreenProvider {
  static bool isMobileScreen(BuildContext context) => MediaQuery.of(context).size.width < 480;

  static bool isTabScreen(BuildContext context) => MediaQuery.of(context).size.width > 480 &&
        MediaQuery.of(context).size.width <= 820;

  static bool isDesktopScreen(BuildContext context) => MediaQuery.of(context).size.width > 820;
}
