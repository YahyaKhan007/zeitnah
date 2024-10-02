import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../services/controller_service/zeitnah_admin_controller.dart';
import '../../../../../constants/app_colors/app_colors.dart';
import '../../../../../constants/app_strings.dart/app_strings.dart';

class PriorityWidget extends StatelessWidget {
  const PriorityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<ZeitnahAdminController>();
    return Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PriorityOnOffWidget(),
                // !controller.isPriorityFunction.value
                //     ? const SizedBox(
                //         height: 120,
                //       )
                //     :
                Opacity(
                  opacity: controller.isPriorityFunction.value ? 1 : 0,
                  child: IgnorePointer(
                    ignoring: !controller.isPriorityFunction.value,
                    // Disables interactions when opacity is 0
                    child: Container(
                      margin: const EdgeInsets.only(left: 24),
                      decoration: BoxDecoration(
                        color: AppColors.kcPrimaryWhite,
                        border: Border.all(
                          color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kcgreyFieldColor.withOpacity(0.4),
                            offset: const Offset(0, 0),
                            blurRadius: 3,
                          )
                        ],
                      ),
                      width: size.width * 0.185,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: SizedBox(
                              height: 40,
                              width: size.width,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: AppStrings.setPriorityTime.length,
                                itemBuilder: (context, index) =>
                                    Obx(() => SizedBox(
                                          width: size.width * 0.055,
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${AppStrings.setPriorityTime[index]} min",
                                                style: TextStyle(
                                                  color: AppColors
                                                      .kcPrimaryBlackColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Radio(
                                                value: AppStrings
                                                    .setPriorityTime[index],
                                                groupValue: controller
                                                    .setPriorityTime.value,
                                                onChanged: (value) {
                                                  controller.setPriorityTime
                                                      .value = value!;
                                                  controller.customPriority
                                                      .value = false;
                                                },
                                              ),
                                            ],
                                          ),
                                        )),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          customButtom(
                              size: size,
                              color: AppColors.kcPrimaryBlackColor,
                              buttonSize: size.width * 0.12,
                              label: "Custom Time",
                              height: size.width * 0.025),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )

        //     AnimatedContainer(
        //   // width: size.width,
        //   duration: const Duration(milliseconds: 500),
        //   alignment: controller.isPriorityFunction.value == true
        //       ? Alignment.centerLeft
        //       : Alignment.centerLeft,
        //   child: Center(
        //     child: Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         const PriorityOnOffWidget(),
        //         Visibility(
        //           visible: controller.isPriorityFunction.value,
        //           child: Column(
        //             children: [
        //               TweenAnimationBuilder(
        //                 tween: Tween<double>(begin: 0, end: 1),
        //                 duration: const Duration(milliseconds: 500),
        //                 builder: (context, value, _) {
        //                   return Container(
        //                     // duration: const Duration(milliseconds: 1500),
        //                     margin: const EdgeInsets.only(left: 24),
        //                     decoration: BoxDecoration(
        //                         color: AppColors.kcPrimaryWhite,
        //                         border: Border.all(
        //                             color: AppColors.kcgreyFieldColor
        //                                 .withOpacity(0.5)),
        //                         borderRadius: BorderRadius.circular(8),
        //                         boxShadow: [
        //                           BoxShadow(
        //                             color: AppColors.kcgreyFieldColor
        //                                 .withOpacity(0.4),
        //                             offset: const Offset(0, 0),
        //                             blurRadius: 3,
        //                           )
        //                         ]),
        //                     width: size.width * 0.185 * value,
        //                     padding: const EdgeInsets.symmetric(
        //                         horizontal: 16, vertical: 8),
        //                     // height: 120.h,
        //                     child: Column(
        //                       mainAxisSize: MainAxisSize.min,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       mainAxisAlignment: MainAxisAlignment.center,
        //                       children: [
        //                         Flexible(
        //                           child: SizedBox(
        //                             height: 40,
        //                             width: size.width,
        //                             child: ListView.builder(
        //                               shrinkWrap: true,
        //                               physics:
        //                                   const NeverScrollableScrollPhysics(),
        //                               scrollDirection: Axis.horizontal,
        //                               itemCount:
        //                                   AppStrings.setPriorityTime.length,
        //                               itemBuilder: (context, index) => Obx(() =>
        //                                   SizedBox(
        //                                     width: size.width * 0.055,
        //                                     height: 40,
        //                                     child: Row(
        //                                       mainAxisAlignment:
        //                                           MainAxisAlignment.center,
        //                                       mainAxisSize: MainAxisSize.max,
        //                                       crossAxisAlignment:
        //                                           CrossAxisAlignment.center,
        //                                       children: [
        //                                         // 24.w.horizontalSpace,
        //                                         Text(
        //                                           "${AppStrings.setPriorityTime[index]} min",
        //                                           style: TextStyle(
        //                                               color: AppColors
        //                                                   .kcPrimaryBlackColor,
        //                                               fontWeight: FontWeight.bold,
        //                                               fontSize: 12),
        //                                         ),
        //                                         Radio(
        //                                             value: AppStrings
        //                                                 .setPriorityTime[index],
        //                                             groupValue: controller
        //                                                 .setPriorityTime.value,
        //                                             onChanged: (value) {
        //                                               controller.setPriorityTime
        //                                                   .value = value!;
        //                                               controller.customPriority
        //                                                   .value = false;
        //                                             }),
        //                                         // 8.w.horizontalSpace,
        //                                       ],
        //                                     ),
        //                                   )),
        //                             ),
        //                           ),
        //                         ),
        //                         const SizedBox(height: 16),
        //                         customButtom(size, AppColors.kcPrimaryBlackColor,
        //                             size.width * 0.12, "Custom Time")
        //                       ],
        //                     ),
        //                   );
        //                 },
        //               ),
        //             ],
        //           ),
        //         ),
        //
        //         //
        //         // AnimatedOpacity(opacity: opacity, duration: duration)
        //       ],
        //     ),
        //   ),
        // ),

        );
  }
}

class PriorityOnOffWidget extends StatelessWidget {
  const PriorityOnOffWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<ZeitnahAdminController>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => SvgPicture.asset(
                'assets/icons/diomond.svg',
                // ignore: deprecated_member_use
                height: size.height * 0.03,
                color: controller.isPriorityFunction.value
                    ? const Color(0xffC4B420)
                    : null,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Priority Function',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.kcPrimaryBlackColor,
              ),
            ),
          ],
        ),
        Obx(() => Transform.scale(
              scale: 0.8, // Adjust the scale value to make the Switch smaller
              child: Switch(
                activeTrackColor: AppColors.kcPrimaryColor,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: AppColors.kcgreyFieldColor.withOpacity(0.4),
                value: controller.isPriorityFunction.value,
                onChanged: (val) {
                  controller.isPriorityFunction.value = val;
                  if (val) {
                    // setPriorityTime(context: context);
                  }
                },
              ),
            ))
      ],
    );
  }
}

Widget customButtom(
    {required Size size,
    required Color color,
    required double buttonSize,
    required String label,
    double? height}) {
  return Center(
    child: Container(
      // height: size.height * 0.045,
      width: buttonSize,
      height: height ?? 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      padding: EdgeInsets.symmetric(vertical: height != null ? 8 : 0),
      child: Center(
          child: Text(
        label,
        style: TextStyle(
            color: AppColors.kcPrimaryWhite,
            fontSize: size.height * 0.015,
            fontWeight: FontWeight.w600),
      )),
    ),
  );
}
