import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/responsive/responsive_config.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/trainee/select_coach_screen/controller/select_coach_controller.dart';
import 'package:final_project/view/trainee/select_coach_screen/widget/coach_details_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectCoachScreen extends StatelessWidget {
  const SelectCoachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SelectCoachController controller = Get.put(SelectCoachController());
    return GetBuilder<SelectCoachController>(
        builder: (controller) => ResponsiveConfig.setupResponsiveWrapper(
          child: Scaffold(
                  body: SafeArea(
                child: Padding(
                  padding:  EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                   SizedBox(height: 0.05.sh),
                      Text("Select a coach to start your fitness journey",
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              //  fontWeight: FontWeight.w700,
                              fontFamily: 'SourceSerif4')),
                     SizedBox(height: 0.03.sh),
                      Expanded(
                        child: controller.isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                              itemCount: controller.coaches.length,
                              itemBuilder: (context, index) {
                                final coach = controller.coaches[index];
                                final isSelected =
                                    controller.selectedCoachIndex == index;
                                                        
                                return GestureDetector(
                                  onTap: () {
                                    // controller.selectCoach(index);
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (_) => CoachDetailsSheet(
                                        coach: coach,
                                        onSendRequest: () {
                                          controller.selectCoach(index);
                                          controller.sendRequestToCoach(
                                              coach.id.toString());
                                                        
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(vertical: 8.h),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 16.h, horizontal: 16.w),
                                    // decoration: BoxDecoration(
                                    //   color:
                                                        
                                    //        Colors.white,
                                    //   borderRadius: BorderRadius.circular(12),
                                    //   border: Border.all(
                                    //     color:
                                                        
                                    //          Colors.transparent,
                                                        
                                    //   ),
                                    // ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                        color: Colors
                                            .grey.shade300,
                                        width: 1.2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.1), 
                                          blurRadius: 6,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(children: [
                                      Text(
                                        coach.username,
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: 'Poppins'),
                                      ),
                                      SizedBox(height: 8.h),
                                    ]),
                                  ),
                                );
                              },
                            ),
                      ),
                            
                       SizedBox(height: 16.h),
                      
                    ],
                  ),
                ),
              )),
        ));
  }
}
