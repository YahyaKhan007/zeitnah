import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_colors/app_colors.dart';

class UserRequestForProvider extends StatelessWidget {
  const UserRequestForProvider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.only(left: size.width * 0.1),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: size.height * 0.75,
          width: size.width * 0.35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                    offset: const Offset(0, 0),
                    blurRadius: 3),
              ],
              color: AppColors.kcPrimaryWhite),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Client Requests",
                  style: TextStyle(
                      fontSize: 18, color: AppColors.kcPrimaryBlackColor),
                ),
                const SizedBox(height: 24),
                Text(
                  "Users",
                  style: TextStyle(
                      fontSize: 12, color: AppColors.kcPrimaryBlackColor),
                ),
                const SizedBox(height: 8),
                Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                              height: 32,
                            ),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return userRequest();
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userRequest() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Alexa Liras",
                  style: TextStyle(
                      color: AppColors.kcPrimaryBlackColor, fontSize: 14)),
              const Text(
                "alexa@simmmple.com",
                style:
                    TextStyle(color: AppColors.kcgreyFieldColor, fontSize: 14),
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: acceptRejectOption(
                  color: AppColors.kcPrimaryColor,
                  isTick: true,
                  label: 'Accept',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: acceptRejectOption(
                  color: AppColors.kcPrimaryBlackColor,
                  isTick: true,
                  label: 'Decline',
                  onTap: () {},
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget acceptRejectOption(
      {required Color color,
      required bool isTick,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isTick ? 'assets/icons/check.svg' : 'assets/icons/close.svg',
              height: 16,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 12, color: AppColors.kcPrimaryWhite),
            )
          ],
        ),
      ),
    );
  }

  Widget acceptRejectOptionForWeb(
      {required Color color,
      required bool isTick,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                isTick ? 'assets/icons/check.svg' : 'assets/icons/close.svg'),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 16, color: AppColors.kcPrimaryWhite),
            )
          ],
        ),
      ),
    );
  }
}
