import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/const_data/routes.dart';
import 'package:final_project/core/responsive/responsive_config.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/coach/build_program/controller/build_program_controller.dart';
import 'package:final_project/view/trainee/my_program/controller/my_program_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProgramScreen extends StatelessWidget {
  const MyProgramScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MyProgramController controller = Get.put(MyProgramController());
    
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return GetBuilder<MyProgramController>(builder: (controller) {
       if (!controller.isRequestChecked) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (controller.requestInfo == null) {
          Get.toNamed(Routes.selectCoachScreen);
          return SizedBox();
        }
  // if (controller.requestInfo!.status == 'Rejected') {
  //   return Scaffold(
  //     body: Padding(
  //       padding: EdgeInsets.all(16.w),
  //       child: Center(
  //         child: Text(
  //           'Your request has been rejected by the coach.',
  //           style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //     ),
  //   );
    
  // }
if (controller.requestInfo!.status == 'Rejected') {
  Future.delayed(Duration.zero, () {
    Get.dialog(
      AlertDialog(
        title: Text("Request Rejected"),
        content: Text("Your request has been rejected by the coach. You will be redirected to select another coach."),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close dialog
              Get.toNamed(Routes.selectCoachScreen); // Navigate
            },
            child: Text("OK"),
          ),
        ],
      ),
      barrierDismissible: false,
    );

  });
return Scaffold(
    backgroundColor: Colors.white, 
    body: Center(
      child: Text(
        '',
        style: TextStyle(fontSize: 16.sp, color: Colors.black),
      ),
    ),
  );
}

  if (controller.requestInfo!.status == 'Pending') {
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.all(16.w),
        child: Center(
          child: Text(
            'Your request is pending. Please wait for approval.',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
      return ResponsiveConfig.setupResponsiveWrapper(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "My Program",
              style: TextStyle(
                  fontSize: isLandscape ? 20.sp : 26.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SourceSerif4",
                  shadows: [
                    Shadow(
                        color: Colors.black26,
                        blurRadius: 0.2,
                        offset: Offset(1, 2))
                  ]),
            ),
            centerTitle: true,
            backgroundColor: AppColor.primaryColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Get.back();
              },
            ),
            elevation: 0,
          ),
          body: 
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(isLandscape ? 8.w : 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/workoutProgram');
                    },
                    child: Container(
                      width: double.infinity,
                      height: isLandscape ? 100.h : 120.h,
                      padding: EdgeInsets.symmetric(
                          vertical: isLandscape ? 10.h : 16.h,
                          horizontal: isLandscape ? 14.w : 20.w),
                      decoration: BoxDecoration(
                        // color: Color(0xFF82B1FF),
                        // color: Color(0xffFFEC8B),
                        // color: Color(0xffB5E1FA),
                        // color: Color(0xffB6F075),
                        // color: Color(0xFF80D8FF),
                        // color: Color(0xFFFFF59D),
                        color: Color(0xFFD6EDFF),
                        // color: AppColor.primaryColor2,
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1), // ظل خفيف
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/iconimage.png',
                            width: isLandscape ? 70.w : 80.w,
                            height: isLandscape ? 70.h : 80.h,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "Workout Program",
                            style: TextStyle(
                              fontSize: isLandscape ? 14.sp : 18.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SourceSerif4",
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  offset: Offset(1, 2),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/nutritionProgram');
                    },
                    child: Container(
                      width: double.infinity,
                      height: isLandscape ? 100.h : 120.h,
                      //    padding: const EdgeInsets.symmetric(vertical: 16),
                      padding: EdgeInsets.symmetric(
                          vertical: isLandscape ? 10.h : 16.h,
                          horizontal: isLandscape ? 14.w : 20.w), //
                      decoration: BoxDecoration(
                        //  color: Color(0xFFDFFFD6),
                        // color:  AppColor.secondaryColor2,
                        color: Color(0xFFD1D9FF),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1), // ظل خفيف
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/nuration.png',
                            width: isLandscape ? 75.w : 85.w,
                            height: isLandscape ? 75.h : 85.h,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            "Nutrition Program",
                            style: TextStyle(
                              fontSize: isLandscape ? 14.sp : 18.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SourceSerif4",
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  offset: Offset(1, 2),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
