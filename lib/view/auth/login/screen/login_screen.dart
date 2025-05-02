import 'package:final_project/core/class/circular_progress_indicator_custom.dart';
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/responsive/responsive_config.dart';
import 'package:final_project/view/auth/login/controller/login_controller.dart';
import 'package:final_project/view/auth/widget/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/custom_botton.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return GetBuilder<LoginController>(
        builder: (controller) =>
            Form(
              key: controller.formKey,
              child: ResponsiveConfig.setupResponsiveWrapper(
                child: Scaffold(
                    body: Stack(
                    children: [ SingleChildScrollView(
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                              SizedBox(height: 112.h),
                                Text(
                                  'Welcome Back',style: TextStyle(
                                          color: Colors.black,fontSize: 32,
                                          fontFamily: "SourceSerif4",
                                        //  fontWeight: FontWeight.bold,
                                        fontWeight: FontWeight.w600,
                                  )
                                ),
                               SizedBox(height: 67.h),
                                CustomFormTextField(
                                  hintText: 'username',
                                  myController: controller.usernameController,
                                  myValid: controller.validUsername,
                                ),
                              SizedBox(height: 15.h),

                                CustomFormTextField(
                                  hintText: 'Password',
                                  myController: controller.passwordController,
                                  myValid: controller.validPassword,
                                ),
                                // SizedBox(
                                //   height: 40,
                                // ),
                                 SizedBox(height: 130.h),
                                CustomButton(
                                  text: 'Login',
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                controller.login();
                                  },
                                ),
                               SizedBox(height: 10.h),
                                Center(
                                    child: Text(
                                      'Forgot your password?',
                                      style: TextStyle(
                                        
                                          color: AppColor.grey,
                                           decoration: TextDecoration.underline,
                                
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                    )),
                              SizedBox(height: 50.h),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // const Text(
                                      //   'تسجيل الدخول بواسطة',
                                      //   style: TextStyle(
                                      //       color: Colors.black,
                                      //       fontFamily: "Cairo",
                                      //       fontWeight: FontWeight.w400,
                                      //       fontSize: 18),
                                      // ),
                                      // const SizedBox(height: 10),
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   children: [
                                      //     IconButton(
                                      //       icon: Image.asset(
                                      //         'assets/images/Icon (3).png',
                                      //         height: 40,
                                      //         width: 40,
                                      //       ),
                                      //       onPressed: () {},
                                      //     ),
                                      //     IconButton(
                                      //       icon: Image.asset(
                                      //         'assets/images/Icon (2).png',
                                      //         height: 40,
                                      //         width: 40,
                                      //       ),
                                      //       onPressed: () {},
                                      //     ),
                                      //   ],
                                      // ),
                                      //const SizedBox(height: 30),
                                      const Text(
                                        'Don’t have an account yet? ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Cairo",
                                            
                                            fontSize: 14),
                                      ),
                                      // const SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () {
                                          Get.offNamed('/registerScreen');
                                        },
                                        child:  Text(
                                          'Register',
                                          style: TextStyle(
                                              color: AppColor.grey,
                                              fontFamily: "Poppins",
                                              fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                       if (controller.isLoading) const CircularProgressIndicatorCustom(),
                    ]  )
                    ),
              ),
            )
    );
  }
}
