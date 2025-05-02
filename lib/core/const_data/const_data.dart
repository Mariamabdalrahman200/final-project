import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsive_framework/responsive_framework.dart';

class ConstData {
  static bool isLogin = false;

  static String token = "";

// static  List<ResponsiveBreakpoint>points=[
//     ResponsiveBreakpoint.resize(450,name:MOBILE),
//     ResponsiveBreakpoint.autoScale(800,name:TABLET),
//     ResponsiveBreakpoint.autoScale(1000,name:DESKTOP),
//     ResponsiveBreakpoint.autoScale(1200,name:"LARGE_DESKTOP"),
//   ];
  static List<Breakpoint> points = [
    Breakpoint(start: 0, end: 450, name: MOBILE),
    Breakpoint(start: 451, end: 800, name: TABLET),
    Breakpoint(start: 801, end: 1000, name: DESKTOP),
    Breakpoint(start: 1001, end: 1200, name: "LARGE_DESKTOP"),
  ];


  static Future<void> UpdateToken(                   ) async {
    const String clientId = '';
    const String clientSecret = '';

    final response = await http.post(
        Uri.parse('https://test.api.amadeus.com/v1/security/oauth2/token'                  ),
        headers: {
          'content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'grant_type': 'client_credentials',
          'client_id': clientId,
          'client_secret': clientSecret,
        });
    if (response.statusCode == 200                  ) {
      final Map<String, dynamic> data = json.decoder as Map<String, dynamic>;
      token = data['access_token'];
      isLogin = true;
      print('Token updated : $token'                  );
    } else {
      print('Failed to obtain access token : ${response.statusCode}'                  );
      print(' Response body : ${response.body}'                  );
    }
  }

  static Future<void> startTokenUpDater(                   ) async {
    Timer.periodic(const Duration(seconds: 20                  ), (timer) {
      UpdateToken(                   );
    });
  }
}
