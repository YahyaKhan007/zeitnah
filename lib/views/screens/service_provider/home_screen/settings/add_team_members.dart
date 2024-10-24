import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/services/controller_service/controller_service.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

import 'setting_view.dart';

class AddTeamMembers extends StatelessWidget {
  AddTeamMembers({super.key});

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ZeitnahController>();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: settingAppBar(
          controller: nameController, context: context, label: 'Team Members'),
      body: Column(
        children: [
          24.h.verticalSpace,
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.memberList.length,
                itemBuilder: (context, index) {
                  final memberName = controller.memberList[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Container(
                      height: 32.h,
                      width: size.width,
                      margin: EdgeInsets.symmetric(horizontal: 32.w),
                      padding: EdgeInsets.only(left: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color: AppColors.kcGreyColor,
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              memberName,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(
                                color: AppColors.kcPrimaryBlackColor,
                                textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                // Logic to remove the member
                                // controller.memberList.removeAt(index);
                                removeMember(
                                  context: context,
                                  name: memberName,
                                  yes: () {
                                    controller.memberList.removeAt(index);
                                    Get.back();
                                  },
                                  no: () {
                                    Get.back();
                                  },
                                );
                              },
                              child: CircleAvatar(
                                radius: 16.r,
                                backgroundColor: AppColors.kcPrimaryBlackColor,
                                child: const Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
