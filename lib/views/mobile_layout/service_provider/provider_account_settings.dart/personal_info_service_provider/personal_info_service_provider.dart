import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/profile_option_edit.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../widgets/custome_button_with_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../client/account_settings/widgets/ui_functions.dart';


class PersonalInfoServiceProviderScreen extends StatefulWidget {
  const PersonalInfoServiceProviderScreen({super.key});

  @override
  State<PersonalInfoServiceProviderScreen> createState() =>
      _PersonalInfoServiceProviderScreenState();
}

class _PersonalInfoServiceProviderScreenState
    extends State<PersonalInfoServiceProviderScreen> {
  late TextEditingController nameController;
  late TextEditingController surName;
  late TextEditingController phoneNumer;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneNumer = TextEditingController();
    surName = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kcPrimaryBackgrundColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16).w,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                "assets/icons/back.svg",
                color: AppColors.kcPrimaryBlueColor,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Personal Info",
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.kcPrimaryBlackColor,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        body: CupertinoScrollbar(
          thumbVisibility: true,
          radius: Radius.circular(32.r),
          thickness: 4,
          child: SingleChildScrollView(
            child: Column(
              children: [
                16.h.verticalSpace,
                SizedBox(
                  height: size.height * 0.15,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: size.height * 0.065,
                        backgroundImage:
                            const AssetImage('assets/icons/hospital.png'),
                      ),
                    ],
                  ),
                ),
                16.h.verticalSpace,
                profileOptionEdit(
                    size: size,
                    onTap: () {},
                    label: "Clinic Name",
                    data: "Eduard",
                    controller: nameController),
                profileOptionEdit(
                    size: size,
                    onTap: () {},
                    label: "City",
                    data: "Ott",
                    controller: surName),
                profileOptionEdit(
                    size: size,
                    onTap: () {},
                    label: "Street",
                    data: "Ott",
                    controller: surName),
                profileOptionEdit(
                    size: size,
                    onTap: () {},
                    label: "E-Mail",
                    data: "abc@gmail.com",
                    controller: nameController),
                profileOptionEdit(
                    size: size,
                    onTap: () {},
                    label: "Phone Number",
                    data: "+4912312312312",
                    controller: phoneNumer),
                24.h.verticalSpace,
                customeButtonWithIcon(
                    backGroundColor: Colors.white,
                    textColor: AppColors.kcPrimaryBlackColor,
                    text: "Delete Account",
                    size: size,
                    image: "assets/icons/delete_icon.svg",
                    // imageColor: Colors.transparent,
                    borderRadius: 48.r,
                    onTap: () {
                      deleteAccount(context: context);
                    }),
                24.h.verticalSpace,
            
              ],
            ),
          ),
        ));
  }
}
