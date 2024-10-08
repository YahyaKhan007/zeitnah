import 'package:get/get.dart';
import 'widgets/ui_functions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/profile_option_edit.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../widgets/custome_button_with_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  late TextEditingController nameController;
  late TextEditingController surName;
  late TextEditingController phoneNumber;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneNumber = TextEditingController();
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
                    fontSize: 20.sp,
                    color: AppColors.kcPrimaryBlackColor,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              40.h.verticalSpace,
              profileOptionEdit(
                  size: size,
                  onTap: () {},
                  label: "Name",
                  data: "Eduard",
                  controller: nameController),
              profileOptionEdit(
                  size: size,
                  onTap: () {},
                  label: "Surname",
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
                  controller: phoneNumber),
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
            ],
          ),
        ));
  }


}
