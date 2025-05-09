import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/responsive/responsive_config.dart';
import 'package:final_project/view/auth/register/controller/register_controller.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/auth/widget/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

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
                padding: const EdgeInsets.all(16.0),
                child: Form(
                   key: controller.phoneFormKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 105.h,
                      ),
                      Text(
                        "Enter your phone number",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'SourceSerif4'),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      CustomFormTextField(
                        hintText: 'Phone Number',
                        myController: controller.phoneController,
                        myValid: controller.validPhoneNumber,
                        keyboardType: TextInputType.phone,
                      ),
                          
                      SizedBox(
                        height: 200.h,
                      ),
                      CustomButton(
                        text: 'Next',
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          // Get.offNamed('/secondScreen');
                          //  controller.register();
                          controller.generateUsername();
                          if (controller.phoneFormKey.currentState!
                              .validate()) {
                            // Get.toNamed('/secondScreen');
                            Get.toNamed('/genderSelectionScreen');
                          }
                        },
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
