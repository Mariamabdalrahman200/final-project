 import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/responsive/responsive_config.dart';
import 'package:final_project/view/auth/register/controller/register_controller.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/auth/widget/primary_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class GenderSelectionScreen extends StatelessWidget {
  final RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: ResponsiveConfig.setupResponsiveWrapper(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
                  padding:  EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    SizedBox(height: 40.h),
                  const PrimaryTitleWidget(text: "Select your Gender"),
                  SizedBox(
                     height: 500.h, 
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          FractionallySizedBox(
                          widthFactor: 0.45,
                            heightFactor: 0.5,
                            child: Obx(() => AnimatedContainer(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOut,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        blurRadius: 10,
                                        spreadRadius: 5,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                    color: controller.selectedGenderIndex.value == 0
                                      //  ? Colors.blue
                                          ? AppColor.primaryColor2
                                            : AppColor.secondaryColor2,
                                      //  : Colors.pinkAccent,
                                        //   ? AppColor.
                                        // : Colors.pinkAccent,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(60),
                                      bottomRight: Radius.circular(60),
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(
                          width: 300.w,
                          height: 570.h,
                            child: Obx(() => CarouselSlider(
                                  items: controller.genders.map((gender) {
                                    return Obx(() {
                                      double scale = controller.genders
                                                  .indexOf(gender) ==
                                              controller.selectedGenderIndex.value
                                          ? 1.2
                                          : 0.8;
                                      return Transform.scale(
                                        scale: scale,
                                        child: buildImage(
                                            gender.image, gender.caption),
                                      );
                                    });
                                  }).toList(),
                                  options: CarouselOptions(
                                  height: 400.h,
                                    viewportFraction: 0.7,
                                    enlargeCenterPage: true,
                                    onPageChanged: (index, reason) {
                                      controller.updateSelectedGender(index);
                                    },
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
              
                  
                     CustomButton(
                    text:     "Next",
                      onTap: () {
                            print('The gender is: ${controller.SelectedGender()}');
            
                    Get.toNamed('/heightScreen');
                    
                            },
                      ),
                    
                
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, String caption) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Image.asset(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
         SizedBox(height: 10.h),
        Text(
          caption,
          style:  TextStyle(
            fontSize: 27.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}