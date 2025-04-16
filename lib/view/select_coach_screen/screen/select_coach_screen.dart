import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/select_coach_screen/controller/select_coach_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SelectCoachScreen extends StatelessWidget {
  const SelectCoachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final SelectCoachController controller = Get.put(SelectCoachController());
    return GetBuilder<SelectCoachController>(
        //  init: SelectCoachController(),
        builder: (controller) => Scaffold(
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
                      SizedBox(
                        height: media.width * 0.15,
                      ),
                      Text("Select a coach to start your fitness journey",
                          style: TextStyle(
                              fontSize: 26,
                               fontWeight: FontWeight.bold,
                            //  fontWeight: FontWeight.w700,
                              fontFamily: 'SourceSerif4')),
                      SizedBox(
                        height: media.width * 0.12,
                      ),
                      controller.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              height: media.height * 0.4,
                              child: ListView.builder(
                                itemCount: controller.coaches.length,
                                itemBuilder: (context, index) {
                                  final coach = controller.coaches[index];
                                  final isSelected =
                                      controller.selectedCoachIndex == index;

                                  return GestureDetector(
                                    onTap: () {
                                      controller.selectCoach(index);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 16),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? AppColor.primaryColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: isSelected
                                              ? AppColor.primaryColor2
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                      ),
                                      child: Column(children: [
                                        Text(
                                          "Name: ${coach.username}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontFamily: 'Poppins'),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "Email: ${coach.email}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black54,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "Experience Level: ${coach.experianseLevel}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black54,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  );
                                },
                              ),
                            ),
                      SizedBox(
                        height: media.width * 0.2,
                      ),
                      CustomButton(
                        text: 'Next',
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          // Get.offNamed('/secondScreen');
                          //  controller.register();
                          controller.sendRequestToCoach(
         controller.coaches[controller.selectedCoachIndex].id.toString());

                          // Get.toNamed('/experianseScreen');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
