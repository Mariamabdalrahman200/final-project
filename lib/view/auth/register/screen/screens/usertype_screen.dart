import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/responsive/responsive_config.dart';
import 'package:final_project/view/auth/register/controller/register_controller.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/auth/widget/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UsertypeScreen extends StatelessWidget {
  const UsertypeScreen({super.key});
  @override
  Widget build(BuildContext context) {
  
    final RegisterController controller = Get.put(RegisterController());
    return GetBuilder<RegisterController>(
        //  init: RegisterController(),
        builder: (controller) => ResponsiveConfig.setupResponsiveWrapper(
          child: Scaffold(
                  body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 112.h,
                        ),
          
                        Text("Are you a coach or a trainee?",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                //  fontWeight: FontWeight.bold,
                                fontFamily: 'SourceSerif4')),
          
                        SizedBox(
                          height: 67.h,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.changeUserType("coach");
                                // controller.selectedUserType = "coach";
                                //    Get.toNamed('/loginScreen');
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: controller.selectedUserType == "coach"
                                      ? AppColor.primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: controller.selectedUserType == "coach"
                                        ? AppColor.primaryColor2
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  "Coach",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: controller.selectedUserType == "coach"
                                        ? AppColor.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            GestureDetector(
                              onTap: () {
                                controller.changeUserType("trainer");
                                //  Get.toNamed('/registerScreen');
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                width: double.infinity,
                                //  padding: EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  color: controller.selectedUserType == "trainer"
                                      ? AppColor.primaryColor
                                      : AppColor.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color:
                                        controller.selectedUserType == "trainer"
                                            ? AppColor.primaryColor2
                                            : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  "Trainee",
                                  textAlign: TextAlign.center,
          
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color:
                                        controller.selectedUserType == "trainer"
                                            ? AppColor.white
                                            : Colors.black,
                                            fontWeight: FontWeight.w600,
                                  //  fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins'
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 150.h,
                        ),
          
                        CustomButton(
                          text: 'Next',
                          onTap: () {
                      
                            if (controller.selectedUserType == "trainer") {
                              Get.toNamed('/registerScreen');
                            } else if (controller.selectedUserType == "coach") {
                              Get.toNamed('/loginScreen');
                            }
                          
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ));
  }
}
