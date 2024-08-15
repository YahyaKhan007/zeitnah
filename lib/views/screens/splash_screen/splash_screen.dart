import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeitnah/blocs/blocs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    context.read<SplashBloc>().add(const SplashInitialEvent());
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
            // Text(
            //   'Zeit',
            //   style: GoogleFonts.odorMeanChey(
            //       textStyle: TextStyle(fontSize: 100.sp, color: Colors.black)),
            // ),
            // Text(
            //   'Nah',

            //   style: GoogleFonts.odorMeanChey(
            //     height: ,
            //       textStyle: TextStyle(fontSize: 100.sp, color: Colors.black)),
            // ),
          ],
        ),
      ),
    );
  }
}
