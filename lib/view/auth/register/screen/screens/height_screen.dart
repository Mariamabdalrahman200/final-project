
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/responsive/responsive_config.dart';
import 'package:final_project/view/auth/register/controller/register_controller.dart';
import 'package:final_project/view/auth/widget/height_line.dart';
import 'package:final_project/view/auth/widget/primary_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeightScreen extends StatelessWidget {
  final RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
      final orientation = MediaQuery.of(context).orientation;
  final isPortrait = orientation == Orientation.portrait;
    return SafeArea(
      child: ResponsiveConfig.setupResponsiveWrapper(
        child: Scaffold(
          appBar: AppBar(),
          body: Obx(() {
            double height = controller.heightModel.value.height;
            double screenHeight = 1.sh;
            double imageHeight = isPortrait
    ? screenHeight * 0.6
    : screenHeight * 0.8;
          //  double topPosition = screenHeight * 0.6 - (height - 170) * 5;
          double topPosition = (screenHeight * 0.6 - (height - 170) * 5).clamp(0.0, screenHeight * 0.8);
        
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const PrimaryTitleWidget(text: "Specify your height"),
                ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 300.h, 
                maxHeight: isPortrait ? 0.6.sh : 0.9.sh,
              ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                     //top: topPosition - 430,
                   top: topPosition - (isPortrait ? 0.5.sh : 0.42.sh),
                          left: 0,
                          right: 0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                               Padding(
                               padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Height_line(),
                                    ),
                                    SizedBox(width: 2.w),
                                    Text(
                                      "cm",
                                      style: TextStyle(
                                          fontSize: 7.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/male.png',
                              width: 1.sw, 
                                height: imageHeight,
                                // fit: BoxFit.fitHeight,
                                 fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    value: height,
                    min: 140,
                    max: 180,
                    activeColor: AppColor.primaryColor,
                  //    activeColor: Colors.blueAccent,
                    onChanged: (value) {
                      controller.updateHeight(value);
                    },
                  ),
                  Text(
                    '${height.toStringAsFixed(1)} cm',
                    style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      //  color: Colors.blueAccent),
                          color: AppColor.thirdColor),
                  ),
                   SizedBox(height: 20.h),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomButton(
                            text: 'Next',
                            onTap: () {
                             print('The height is: ${controller.getHeight()}');
                           Get.toNamed('/secondScreen');
                              }
                            
                          ),
                    ),
                  // SizedBox(
                  //   height: 50,
                  //   width: 250,
                    
                    
                    
                    
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.blue),
                  //     child: const Text(
                  //       "Next",
                  //       style: TextStyle(color: Colors.white, fontSize: 20),
                  //     ),
                  //     onPressed: () {
                  //       print('The height is: ${controller.getHeight()}');
                  //       Get.toNamed('/secondScreen');
                  //     },
                  //   ),
                  // ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}