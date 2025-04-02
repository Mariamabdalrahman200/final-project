import '../const_data/const_data.dart';

class AppLink {
  //static String reg = "127.0.0.1";

  static String appRoot = "https://mohammedmoh.pythonanywhere.com";

  static String register = "$appRoot/register/";
  static String login = "$appRoot/login/";
  static String coaches = "$appRoot/coaches/";
  static String sendjoinrequest = "$appRoot/sendjoinrequest";
  
  
  //static String login = "$appApi/login";
  //static String logout = "$appApi/logout";



  // static String addCountry= "$appApi/add-country";
  // static String countries= "$appApi/api/countries";




  Map<String, String> getHeader() {
    Map<String, String> mainHeader = {
      'Content - Type': 'application/json',
      ' Accept': 'application/json',
      ' x - Requested - with': 'XMLHttpRequest',
    };
    return mainHeader;
  }

  Map<String, String> getHeaderToken() {
    Map<String, String> mainHeader = {
      'Content - Type': 'application/json',
      ' Accept': 'application/json',
      ' x - Requested - with': 'XMLHttpRequest',
      'Autherization': 'Bearer ${ConstData.token}',
    };
    return mainHeader;
  }
}
