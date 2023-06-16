import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

double getProporScreenHeight(double inputHeight) {
  return (inputHeight / 812.0) * SizeConfig.screenHeight;
}

double getProporScreenWidth(double inputWidth) {
  return (inputWidth / 375.0) * SizeConfig.screenWidth;
}
