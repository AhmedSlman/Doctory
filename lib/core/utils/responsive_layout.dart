import 'package:flutter/material.dart';

abstract class ResponsiveLayout {
  static double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double deviceHight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getResponsiveHeight(BuildContext context, double height) {
    double screenHeight = deviceHight(context);
    return screenHeight * height;
  }

  static double getResponsiveWidth(BuildContext context, double width) {
    double screenWidth = deviceWidth(context);
    return screenWidth * width;
  }
}
