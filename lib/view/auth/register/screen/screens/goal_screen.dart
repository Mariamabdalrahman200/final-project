import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/responsive/responsive_config.dart';
import 'package:final_project/view/auth/register/controller/register_controller.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/auth/widget/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();
    return GetBuilder<RegisterController>(
        builder: (controller) => ResponsiveConfig.setupResponsiveWrapper(
          child: Scaffold(
                  body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
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
                      SizedBox(height: 80.h),
          
                        Text("What is your goal?",
                            style: TextStyle(
                                fontSize: 26,
                                //    fontWeight: FontWeight.bold,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SourceSerif4')),
          
                        SizedBox(height: 65.h),
                        // Wrap(
                        //   children: controller.goals.map((e) {
                        //     return InkWell(
                        //       onTap: () {},
                        //       child: Container(
                        //         margin: EdgeInsets.all(8),
                        //         padding: EdgeInsets.symmetric(
                        //             vertical: 12, horizontal: 14),
                        //         decoration: BoxDecoration(
                        //           color: AppColor.lightgrey,
                        //           borderRadius: BorderRadius.circular(20),
                        //         ),
                        //         child: Text(
                        //           e,
                        //           style: TextStyle(
                        //             fontSize: 20,
                        //           ),
                        //         ),
                        //       ),
                        //     );
                        //   }).toList(),
                        // ),
          
                        Container(
                          //  height: MediaQuery.of(context).size.height,
                         height: 250.h,
                          child: ListView.builder(
                            itemCount: controller.goals.length,
                            itemBuilder: (context, index) {
                              final goal = controller.goals[index];
                              final isSelected =
                                  controller.selectedGoalIndex == index;
          
                              return GestureDetector(
                                onTap: () {
                                  controller.selectGoal(index);
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8.h),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.h, horizontal: 16.w),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColor.primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColor.primaryColor2
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Text(
                                    goal,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                       SizedBox(height: 100.h),
          
                        CustomButton(
                          text: 'Next',
                          onTap: () {
                            FocusScope.of(context).unfocus();
          
                            Get.toNamed('/experianseScreen');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
              ),
        )
            );
  }
}
