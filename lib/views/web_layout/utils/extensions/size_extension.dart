// import 'package:flutter/material.dart';
//
// class SizeConfig {
//   static final SizeConfig _instance = SizeConfig._internal();
//
//   factory SizeConfig() => _instance;
//
//   SizeConfig._internal();
//
//   static late double _screenWidth;
//   static late double _screenHeight;
//
//   void init(BuildContext context) {
//     _screenWidth = MediaQuery.of(context).size.width;
//     _screenHeight = MediaQuery.of(context).size.height;
//   }
//
//   static double get screenWidth => _screenWidth;
//
//   static double get screenHeight => _screenHeight;
// }
//
// extension SizeExtension on num {
//   double get h => this * SizeConfig.screenHeight / 100;
//
//   double get w => this * SizeConfig.screenWidth / 100;
// }
//
// extension SizedBoxExtension on num {
//   SizedBox get widthBox => SizedBox(width: toDouble());
//
//   SizedBox get heightBox => SizedBox(height: toDouble());
// }
//
//
//
