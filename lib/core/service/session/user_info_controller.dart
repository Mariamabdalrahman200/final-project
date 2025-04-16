import 'package:final_project/core/class/crud.dart';
import 'package:final_project/core/const_data/const_data.dart';
import 'package:final_project/core/service/link.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserInfoModel? currentUser;
  bool isUserLoading = false;

  Future<void> getInfo() async {
    print('>>>>>>>>>>>>>>>>>>>>>>>${ConstData.token}');
    isUserLoading = true;
    update();

    try {
      var result = await crud().getObject(
        AppLink.getInfo,
        headers: {
          'Authorization': 'Bearer ${ConstData.token}',
          'Accept': 'application/json',
        },
      );
      result.fold(
        (failure) {
          isUserLoading = false;
          print("Error fetching user details: $failure");
          Get.snackbar("Error", "Failed to load user details");
          update();
        },
        (success) {
          currentUser = UserInfoModel.fromJson(success['user']);
          isUserLoading = false;
          update();
        },
      );
    } catch (e) {
      isUserLoading = false;
      print("Unexpected error: $e");
      Get.snackbar("Error", "Unexpected error occurred");
      update();
    }
  }
}
