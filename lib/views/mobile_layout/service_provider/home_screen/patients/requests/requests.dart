import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/patients/patient_controller.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import 'widgets/accept_deline_request.dart';

class PatientRequests extends GetView<PatientScreenController> {
  const PatientRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Obx(
      () => controller.dataController.requestToSubscribeClinicUserList.isEmpty
          ? Center(
              child: Text(
                'No Requests',
                style: TextStyle(
                    fontSize: 12.sp, color: AppColors.kcPrimaryBlackColor),
              ),
            )
          : CupertinoScrollbar(
              thickness: 4.w,
              radius: Radius.circular(40.r),
              thumbVisibility: true,
              child: ListView.builder(
                itemCount: controller
                    .dataController.requestToSubscribeClinicUserList.length,
                itemBuilder: (context, index) {
                  final user = controller
                      .dataController.requestToSubscribeClinicUserList[index];
                  return AcceptDeclineRequest(
                    requestedUser: user,
                    controller: controller,
                  );
                },
              ),
            ),
    ));
  }
}
