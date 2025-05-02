import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/responsive/responsive_config.dart';
import 'package:final_project/view/auth/register/controller/register_controller.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/auth/widget/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();
    // القيمة الافتراضية
    final RulerPickerController rulerPickerController =
        RulerPickerController(value: 50);

    final List<RulerRange> ranges = const [
//  RulerRange(begin: 0, end: 100, scale: 1),

      RulerRange(begin: 0, end: 100, scale: 0.1), // تقسيم كل 0.1
    ];

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
                    SizedBox(
                    height: 80.h
                    ),
        
                    Text(
                      "What is your current weight?",
                      style: TextStyle(fontSize: 20,
                      // fontWeight: FontWeight.bold,
                  fontWeight: FontWeight.w600,
                      fontFamily: 'SourceSerif4',
        
                       ),
                    ),
                    SizedBox(
                    height: 70.h,
                    ),
                    // Ruler with dynamic value
                    Column(
                      children: [
                        // Display the current value
                        Text(
                          "${controller.currentValue.toStringAsFixed(1)} kg",
                          style:  TextStyle(
                            fontSize: 38.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(height: 20.h),
                        // Ruler Picker
                        RulerPicker(
                          controller: rulerPickerController!,
                          ranges: ranges,
                          width:0.9.sw,
                          height: 120.h,
                          rulerMarginTop: 10,
        
                          onValueChanged: (value) {
                            controller.updateCurrentValue(value.toDouble());
                          },
                          onBuildRulerScaleText: (index, scaleValue) {
                            if (scaleValue == null) return '';
                          
                            return scaleValue.toInt().toString();
                          },
                          scaleLineStyleList: const [
                            ScaleLineStyle(
                                color: Colors.black,
                                width: 1.5,
                                height: 50,
                                scale: 0),
                            ScaleLineStyle(
                                color: Colors.grey,
                                width: 1,
                                height: 45,
                                scale: 5),
                            ScaleLineStyle(
                                color: Colors.grey,
                                width: 1,
                                height: 25,
                                scale: -1)
                          ],
        
                          marker: Container(
                            width: 3.w,
                            height: 90.h,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                    height: 100.h,
                    ),
                    CustomButton(
                      text: 'Next',
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Get.toNamed('/goalScreen');
                
                      },
                    ),
        
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
