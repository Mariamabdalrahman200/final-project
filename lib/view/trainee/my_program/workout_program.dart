import 'package:final_project/core/class/circular_progress_indicator_custom.dart';
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/responsive/responsive_config.dart';
import 'package:final_project/view/trainee/my_program/controller/my_program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutProgram extends StatelessWidget {
  const WorkoutProgram({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MyProgramController controller = Get.find();
     final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return GetBuilder<MyProgramController>(
      builder: (controller) => ResponsiveConfig.setupResponsiveWrapper(
        child: Scaffold(
            appBar: AppBar(
            title:  Text(
              "workout",
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
          body: Stack(
            children:[ SafeArea(
              child: Padding(
                padding:  EdgeInsets.all(isLandscape ? 8.w : 16.w),
                child: Column(
                  children: [
                
                    SizedBox(height: isLandscape ? 5.h : 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.weekDays.map((day) {
                        final isSelected = controller.selectedDay == day;
            
                        return GestureDetector(
                          onTap: () => controller.selectDay(day),
                          child: Container(
                           width: isLandscape ? 40.w : 45.w,
                            padding: EdgeInsets.symmetric(vertical: 6.h),
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColor.primaryColor
                                  :
                                  //  Color(0xffFFEC8B),
                                  Colors.grey[300],
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Center(
                              child: Text(
                                day.substring(0, 3),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                   SizedBox(height: isLandscape ? 10.h : 20.h),
                      
            
          
            if (controller.program != null && !controller.isLoading)
              Expanded(
                child: ListView.builder(
                  itemCount: controller.getExercisesByMuscleForSelectedDay().length,
                  itemBuilder: (context, index) {
            final entries = controller.getExercisesByMuscleForSelectedDay().entries.toList();
            final muscleName = entries[index].key;
            final exercises = entries[index].value;
            
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 4.h),
                  child: Text(
                    muscleName,
                    style: TextStyle(
                     fontSize: isLandscape ? 14.sp : 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
            
            
                ...exercises.map((exercise) {
                  return GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: AppColor.blue,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exercise.exercise.name,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: isLandscape ? 10.sp : 14.sp,),
                                  
                                ),
                                SizedBox(height: 4.h),
                                Text("sets: ${exercise.sets} | reps: ${exercise.reps}", style: TextStyle(
                                                  fontSize: isLandscape ? 8.sp : 10.sp,
                                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            );
                  },
                ),
              )
            else
              Center(child: Text("لا يوجد برنامج تدريبي")),
                  ],
                ),
              ),
            ),
           if (controller.isLoading)
                      CircularProgressIndicatorCustom(),
        ]  ),
        ),
      ),
    );
  }
}
