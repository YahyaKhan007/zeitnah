import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../services/services.dart';
import 'widgets/custome_notifications.dart';
import 'widgets/my_calender_appbar.dart';

class MyCalender extends StatelessWidget {
  const MyCalender({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<ZeitnahController>();
    return Scaffold(
      appBar: myCalenderAppbar(context),
      body: Obx(
        () => controller.always.value == true
            ? always(size: size)
            : controller.mute.value == true
                ? mute(size: size)
                : customeNotification(context: context),
      ),
    );
  }

  Widget always({required Size size}) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Center(
        child: SvgPicture.asset("assets/icons/always.svg", height: size.height * 0.15,),
      ),
    );
  }

  Widget mute({required Size size}) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Center(
        child: SvgPicture.asset("assets/icons/mute.svg", height: size.height * 0.15,),
      ),
    );
  }
}
