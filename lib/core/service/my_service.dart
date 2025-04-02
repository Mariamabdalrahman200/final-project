import 'package:final_project/core/const_data/const_data.dart';
import 'package:final_project/core/service/app_keys.dart';
import 'package:get/get.dart';
 import 'package:shared_preferences/shared_preferences.dart';

class MyService extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (await this.getStringValue(AppKeys.storeTokenkey) != null) {
      ConstData.token = (await this.getStringValue(AppKeys.storeTokenkey))!;
    }
    print("this is token");
    print(ConstData.token);
    return this;
  }

  Future<void> saveStringValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getStringValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> setConstantToken() async {
    ConstData.token = (await this.getStringValue(AppKeys.storeTokenkey))!;
    print('Token:${ConstData.token}');
  }
}

initialServices() async {
  await Get.putAsync(() => MyService().init());
}

