import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/appointment_model/appointment_model.dart';
import '../../utils/app_colors/app_colors.dart';
import '../mobile_layout/client/client_homepage/apointments/controller/appointment_controller_for_client.dart';
import 'loading_widget.dart';

Widget clinicProfilePicture(
    {required AppointmentModel appointment,
    required AppointmentControllerForClient controller,
    required double height,
    required double width}) {
  return Container(
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.kcPrimaryBlackColor)),
    height: height,
    width: width,
    child: FutureBuilder(
      future: controller.gettingClinicNameFromAppointment(appointment),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 24.h,
            child: Center(
              child: loadingWidgetInkDrop(
                size: 16.r,
                color: Colors.white24,
              ),
            ),
          );
        }

        if (snapshot.data == null) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              useOldImageOnUrlChange: true,
              imageUrl:
                  'https://www.iconfinder.com/icons/8581109/unknown_user_avatar_profile_person_account_human_icon',
              fit: BoxFit.cover,
            ),
          );
        }

        final clinic = snapshot.data!;

        log("data found");

        if (clinic.profilePicture.isNotEmpty) {
          log("photo empty");

          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.kcPrimaryBlackColor)),
            // height: size.height * 0.12,
            // width: size.height * 0.12,
            // backgroundColor:
            //     AppColors.kcPrimaryBlueColor,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                useOldImageOnUrlChange: true,
                imageUrl: clinic.profilePicture.isEmpty
                    ? 'https://www.iconfinder.com/icons/8581109/unknown_user_avatar_profile_person_account_human_icon'
                    : clinic.profilePicture,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: loadingWidgetInkDrop(
                      size: 20, color: Colors.black), // Loading indicator
                ),
              ),
            ),
            // backgroundImage:
            // AssetImage(AppConstants
            //     .srviceProviderList[index].image),
          );
        }
        return const Text("");
      },

      // appointment.cl
      //   const AssetImage('assets/icons/hospital.png'),
    ),
  );
}
