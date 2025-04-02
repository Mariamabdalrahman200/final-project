import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:final_project/core/class/crud.dart';
import 'package:final_project/core/class/status_request.dart';
import 'package:final_project/core/const_data/routes.dart';
import 'package:final_project/core/service/app_keys.dart';
import 'package:final_project/core/service/link.dart';
import 'package:final_project/core/service/my_service.dart';
import 'package:final_project/models/coach_model/coach_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCoachController extends GetxController {
  bool isLoading = false;
  StatusRequest responce = StatusRequest.loading;
  String responceMessage = '';
  List<Coach> coaches = [];
  int selectedCoachIndex = 1;

  void selectCoach(int index) {
    selectedCoachIndex = index;
    update();
  }




  Future getCoaches() async {
    this.isLoading = true;
    this.responce = StatusRequest.loading;
    update();
    var result = await crud().getData(
      AppLink.coaches,
    );
    result.fold(
      (failure) {
        isLoading = false;

        if (failure == StatusRequest.failure) {
          this.responceMessage = crud.message;
          Get.snackbar(
            " ",
            responceMessage,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.grey[200],
            colorText: Colors.black,
            margin: EdgeInsets.all(10),
            borderRadius: 8,
            boxShadows: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          );
        } else if (failure == StatusRequest.offLineFailure) {
          Get.defaultDialog(
              title: "خطأ", middleText: "لا يوجد اتصال بالإنترنت.");
        } else if (failure == StatusRequest.serverFailure) {
          Get.defaultDialog(title: "خطأ", middleText: "حدث خطأ في الخادم.");
        }
        update();
      },
    (success) {
        // إذا نجح الطلب
        responce = StatusRequest.success;
        // coaches = success.map((item) => Coach.fromJson(item)).toList();
        // List<dynamic> data = success;
      
  
   coaches = success.map((item) => Coach.fromJson(item)).toList();
    
    //    coaches = data.map((item) => Coach.fromJson(item)).toList();
        //  coaches = result;
         isLoading = false;
        update();
      },
    );
  }


  Future sendRequestToCoach(String coachId) async {
  try {
    // الحصول على id المتدرب من SharedPreferences
    String? userId = await MyService().getStringValue(AppKeys.userIdKey);

    if (userId == null) {
      Get.snackbar("Error", "User ID not found. Please login again.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    
    print("Sending request to: ${AppLink.sendjoinrequest}/$userId/$coachId");
    print("Request Body: ${jsonEncode({
      "user_id": userId,
      "coach_id": coachId,
    })}");
    Either<StatusRequest, Map> result = await crud().postData(
      "${AppLink.sendjoinrequest}/$userId/$coachId/", // رابط API لإرسال الطلب
      {
        "user_id": userId,
        "coach_id": coachId,
      },
      {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    result.fold(
      (failure) {
        if (failure == StatusRequest.failure) {
          Get.snackbar("Error", "Failed to send request.",
              snackPosition: SnackPosition.BOTTOM);
        } else if (failure == StatusRequest.offLineFailure) {
          Get.defaultDialog(
              title: "Error", middleText: "No internet connection.");
        } else if (failure == StatusRequest.serverFailure) {
          Get.defaultDialog(title: "Error", middleText: "Server error.");
        }
      },
      (success) {

        print("Response body: $success");
        Get.snackbar(" ", "Request sent successfully",
            snackPosition: SnackPosition.BOTTOM);
      },
    );
  } catch (e) {
    print("Error: $e");
    Get.snackbar("Error", "An unexpected error occurred.",
        snackPosition: SnackPosition.BOTTOM);
  }
}










// Future<UserModel?> getUserData() async {
//   String? userData = await MyService().getStringValue(AppKeys.userDataKey);

//   if (userData == null) {
//     return null;
//   }

//   return UserModel.fromRawJson(userData);
// }
// Future<void> sendRequestToCoach(int coachId) async {
//   UserModel? userModel = await getUserData();

//   if (userModel == null) {
//     Get.snackbar("Error", "User data not found");
//     return;
//   }

//   Map<String, dynamic> requestData = {
//     "user_id": userModel.user.id,
//     "coach_id": coachId,
//   };

   void onInit() {
    super.onInit();
    getCoaches();
  }

  void onClose() {
    super.onClose();
  }
}
