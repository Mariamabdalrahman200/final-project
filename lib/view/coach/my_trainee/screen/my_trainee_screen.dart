import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/responsive/responsive_config.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/coach/build_program/screen/build_program_screen.dart';
import 'package:final_project/view/coach/my_trainee/widget/trainee_details_sheet.dart';
import 'package:final_project/view/coach/requests_screen/widget/request_detail_sheet.dart';
import 'package:final_project/view/coach/view_trainee_workout/view_workout_screen/view_workout_screen.dart';
import 'package:final_project/view/home/coach_home_screen/controller/coach_home_controller.dart';
import 'package:final_project/view/coach/my_trainee/controller/my_trainee_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyTraineeScreen extends StatelessWidget {
  const MyTraineeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final MyTraineeController controller = Get.put(MyTraineeController());
    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My trainees",
            style: TextStyle(
                fontSize: isPortrait ? 26.sp : 20.sp,
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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(isPortrait ? 16.w : 12.w),
            child: Obx(() {
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Total: ${controller.trainees.length}',
                        style: TextStyle(
                          fontSize: isPortrait ? 16.sp : 12.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : controller.trainees.isEmpty
                            ? Center(
                                child: Text(
                                  'No requests available',
                                  style: TextStyle(
                                    fontSize: isPortrait ? 18.sp : 16.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: controller.trainees.length,
                                itemBuilder: (context, index) {
                                  final trainee = controller.trainees[index];
                                  final hasProgram =
                                      controller.traineeProgramStatus[
                                              trainee.id.toString()] ??
                                          false;
                                  return GestureDetector(
                                      onTap: () async {},
                                      child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 6.h),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12.h, horizontal: 16.w),
                                          decoration: BoxDecoration(
                                            //  color: Color(0xffFFEC8B),
                                            // color: Color(0xffB6F075),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 1.w),

                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                blurRadius: 6,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              AppColor
                                                                  .primaryColor,
                                                          radius: 28,
                                                          child: Text(
                                                            trainee.username
                                                                .substring(0, 1)
                                                                .toUpperCase(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  isPortrait
                                                                      ? 20.sp
                                                                      : 16.sp,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 16.w),
                                                        Expanded(
                                                          child: Text(
                                                            trainee.username,
                                                            style: TextStyle(
                                                              fontSize:
                                                                  isPortrait
                                                                      ? 14.sp
                                                                      : 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 12.h),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: ElevatedButton(
                                                            // onPressed: () {
                                                            //   hasProgram
                                                            //       ? Get.to(() =>
                                                            //           ViewWorkoutScreen(
                                                            //               user:
                                                            //                   trainee))
                                                            //       : Get.to(() =>
                                                            //           BuildProgramScreen(
                                                            //               user:
                                                            //                   trainee));
                                                            // },
                                                            onPressed:
                                                                () async {
                                                              //   if (hasProgram) {
                                                              //     Get.to(() =>
                                                              //         ViewWorkoutScreen(
                                                              //             user:
                                                              //                 trainee));
                                                              if (hasProgram) {
                                                                final result =
                                                                    await Get.to(() =>
                                                                        ViewWorkoutScreen(
                                                                            user:
                                                                                trainee));
                                                                if (result ==
                                                                    true) {
                                                                  controller
                                                                      .myTrainees(); 
                                                                }
                                                              } else {
                                                                await Get.to(() =>
                                                                    BuildProgramScreen(
                                                                        user:
                                                                            trainee));
                                                                controller
                                                                    .myTrainees();
                                                              }
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  // Color(0xFFD1D9FF),
                                                                  Color(
                                                                      0xFFD6EDFF),
                                                              elevation: 0,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          4.h),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.r),
                                                              ),
                                                            ),
                                                            child: Text(
                                                              hasProgram
                                                                  ? 'View Workout'
                                                                  : 'Create Workout',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    isPortrait
                                                                        ? 12.sp
                                                                        : 10.sp,
                                                                color: Colors
                                                                    .black87,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 6.w),
                                                        Expanded(
                                                          child: ElevatedButton(
                                                            onPressed: () {},
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  // Color(
                                                                  //     0xFFB2E9DB),
                                                                  Color(
                                                                      0xFFD1D9FF),
                                                              //  Color(0xFFF6E9F8),
                                                              //  backgroundColor: Color(0xFFF2D9FF),
                                                              elevation: 0,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          4.h),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.r),
                                                              ),
                                                            ),
                                                            child: Text(
                                                              'Create Diet',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    isPortrait
                                                                        ? 12.sp
                                                                        : 10.sp,
                                                                color: Colors
                                                                    .black87,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 18,
                                                    color: Colors.grey),
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    builder: (_) =>
                                                        TraineeDetailsSheet(
                                                            trainee: trainee),
                                                  );
                                                },
                                              ),
                                            ],
                                          )));
                                },
                              ),
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
