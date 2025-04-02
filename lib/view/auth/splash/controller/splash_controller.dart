    import 'package:final_project/core/const_data/const_data.dart';
import 'package:final_project/view/home/screen/home_screen.dart';
import 'package:get/get.dart';


    class SplashController extends GetxController {
      @override
      void onInit() {
        super.onInit();
        navigateToLogin();
      }

      void navigateToLogin() async {

        await Future.delayed(const Duration(seconds: 2));

        ConstData.token == "" ? Get.offNamed('/usertypeScreen') : Get.off(const HomeScreen());
        }
    }
    
    