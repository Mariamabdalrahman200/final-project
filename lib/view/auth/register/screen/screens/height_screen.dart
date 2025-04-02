// import 'package:course_getx/controller/height_controller.dart';
// import 'package:course_getx/custom_widgets/height_line.dart';
// import 'package:course_getx/custom_widgets/primary_title_widget.dart';
import 'package:final_project/view/auth/register/controller/register_controller.dart';
import 'package:final_project/view/auth/widget/height_line.dart';
import 'package:final_project/view/auth/widget/primary_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeightScreen extends StatelessWidget {
  final RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          double height = controller.heightModel.value.height;
          double screenHeight = MediaQuery.of(context).size.height;
          double imageHeight = screenHeight * 0.6;
          double topPosition = screenHeight * 0.6 - (height - 170) * 5;

          return SizedBox(
            height: screenHeight,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const PrimaryTitleWidget(text: "Specify your height"),
                  SizedBox(
                    height: screenHeight * 0.6,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: topPosition - 430,
                          left: 0,
                          right: 0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Height_line(),
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "cm",
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/male.png',
                                width: MediaQuery.of(context).size.width,
                                height: imageHeight,
                                fit: BoxFit.fitHeight,
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
                    activeColor: Colors.blueAccent,
                    onChanged: (value) {
                      controller.updateHeight(value);
                    },
                  ),
                  Text(
                    '${height.toStringAsFixed(1)} cm',
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        print('The height is: ${controller.getHeight()}');
                        Get.toNamed('/secondScreen');
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}