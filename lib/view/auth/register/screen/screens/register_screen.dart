import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/responsive/responsive_config.dart';
import 'package:final_project/view/auth/register/controller/register_controller.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/auth/widget/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();
    return GetBuilder<RegisterController>(
        //  init: RegisterController(),
        builder: (controller) => ResponsiveConfig.setupResponsiveWrapper(
          child: Scaffold(
              body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                   key: controller.registerFormKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [],
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Text(
                        "Create your account",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "SourceSerif4",
                          //  fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      CustomFormTextField(
                        hintText: 'Email',
                        myController: controller.emailController,
                        myValid: controller.validGlobal,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomFormTextField(
                        hintText: 'First Name',
                        myController: controller.firstnameController,
                        myValid: controller.validUsername,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomFormTextField(
                        hintText: 'Last Name',
                        myController: controller.lastnameController,
                        myValid: controller.validUsername,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomFormTextField(
                        hintText: 'Password',
                        myController: controller.passwordController,
                        myValid: controller.validPassword,
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      CustomButton(
                        text: 'Next',
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          controller.generateUsername();
                          if (controller.registerFormKey.currentState!
                              .validate()) {
                            Get.toNamed('/phoneScreen');
                          }
                        },
                      ),
                      SizedBox(height: 40.h),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Cairo",
                                  fontSize: 14.sp),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.offNamed('/loginScreen');
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: AppColor.grey,
                                    fontFamily: "Poppins",
                                    fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
        ));
  }
}
