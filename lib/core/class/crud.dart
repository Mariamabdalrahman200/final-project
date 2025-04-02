import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:final_project/core/class/status_request.dart';
import 'package:final_project/core/const_data/const_data.dart';
import 'package:final_project/core/service/app_keys.dart';
import 'package:final_project/core/service/my_service.dart';
import 'package:http/http.dart ' as http;
import 'check_internat.dart';

class crud {
static String message = '';
Future<Either<StatusRequest, Map>> postData(
    String LinkUrl, Map data, Map<String, String> header) async {
  try {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(LinkUrl),
          body: jsonEncode(data),
          //  body: data,
          headers: header);
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = jsonDecode(response.body);
        print(response.body);
        if (responseBody.containsKey('data') &&
            responseBody['data'].containsKey('token')) {
          var token = responseBody['data']['token'];
          await MyService().saveStringValue(AppKeys.storeTokenkey, token);
          await MyService().setConstantToken();
        }
        return Right(responseBody);
      } else {
        var responseBody = jsonDecode(response.body);
        print("Error Response: ${responseBody}");
        if (responseBody.containsKey('message')) {
          message = responseBody['message'];
        } else {
          message = 'حدث خطأ غير معروف';
        }
        print (message);

        return const Left(StatusRequest.failure);
      }
    } else {
      return const Left(StatusRequest.serverFailure);
    }
  } catch (_) {
    print(_);
    return const Left(StatusRequest.serverFailure);
  }
}


Future<Either<StatusRequest, List<dynamic>>> getData(String linkUrl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkUrl), headers: {
        //  'authorization': 'Bearer ${ConstData.token}',
          'Accept': 'application/json'
        });
        if (response.statusCode == 200 || response.statusCode == 201) {
      //    Map responsebody = jsonDecode(response.body);
           List<dynamic> responsebody = jsonDecode(response.body);
          print("========== $responsebody ==========");
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
      return const Left(StatusRequest.offLineFailure);
    }
    } catch (e) {
      print(e);
      return const Left(StatusRequest.serverFailure);
    }
  }
}
