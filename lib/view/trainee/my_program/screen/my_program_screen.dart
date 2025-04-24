import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/coach/build_program/controller/build_program_controller.dart';
import 'package:final_project/view/trainee/my_program/controller/my_program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProgramScreen extends StatelessWidget {
  
  const MyProgramScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final MyProgramController controller = Get.put(MyProgramController());

    return GetBuilder<MyProgramController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor ,
          elevation: 0,
          centerTitle: true, 
          title: Text(
            "My Program", 
            style: TextStyle(
              color:Colors.white, 
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed('/workoutProgram');
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                    "Workout Program",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

          
              GestureDetector(
                onTap: () {
                  Get.toNamed('/nutritionProgram'); 
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                  "Nutrition Program",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
    
      ),
    );
  }
}
