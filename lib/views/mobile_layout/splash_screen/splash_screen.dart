import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'splashController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.find<SplashController>();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0),
        () => controller.checkingForUserAuthentication());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset("assets/icons/splash_icon.png"),
            SvgPicture.asset("assets/icons/splash_icon_2.svg"),
            SvgPicture.asset("assets/icons/splash_icon_1.svg"),
          ],
        ),
      ),
    );
  }
}
