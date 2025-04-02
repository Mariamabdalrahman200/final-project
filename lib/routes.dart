import 'package:final_project/view/auth/login/screen/login_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/experianse_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/gender_selection_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/goal_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/height_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/phone_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/register_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/second_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/usertype_screen.dart';
import 'package:final_project/view/auth/splash/screen/splash_screen.dart';
import 'package:final_project/view/home/screen/home_screen.dart';
import 'package:final_project/view/select_coach_screen/screen/select_coach_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  ////////////Auth////////////////
 GetPage(name: "/splashScreen", page: () => SplashScreen()),
 GetPage(name: "/loginScreen", page: () => const LoginScreen()),
 GetPage(name: "/registerScreen", page: () => const RegisterScreen()),
  GetPage(name: "/secondScreen", page: () => const SecondScreen()),
  GetPage(name: "/goalScreen", page: () => const GoalScreen()),
  GetPage(name: "/experianseScreen", page: () => const ExperianseScreen()),
  GetPage(name: "/phoneScreen", page: () => const PhoneScreen()),
  GetPage(name: "/usertypeScreen", page: () => const UsertypeScreen()),
  
  GetPage(name: "/heightScreen", page: () => HeightScreen()),
  GetPage(name: "/genderSelectionScreen", page: () => GenderSelectionScreen()),
  ///////////////home/////////////////////////////////

 GetPage(name: "/homeScreen", page: () => const HomeScreen()),
  GetPage(name: "/selectCoachScreen", page: () => const SelectCoachScreen()),

  
  /////////////////profile////////////////////////
  
  //////////////////////////setting////////////////////////

  // GetPage(name: "/settingScreen", page: () =>  SettingScreen()),
  // GetPage(name: "/notificationScreen", page: () => const NotificationScreen()),
  // GetPage(
  //     name: '/settingsOptionScreen', page: () => const SettingsOptionsScreen()),
  // GetPage(name: "/aboutScreen", page: () => const AboutScreen()),
  // //////////////////poll////////////
  // GetPage(name: "/pollScreen", page: () => const PollScreen()),
  /////////////option//////////////////////
  // GetPage(name: '/sourcesScreen', page: () => const SourcesScreen()),
  // GetPage(name: '/interestsScreen', page: () => const InterestsScreen()),
  // GetPage(name: '/countryScreen', page: () => const CountryScreen()),

  /////////////////////save page////////////////
  // GetPage(name: '/savedArticlesPage', page: () =>  SavedArticlesPage()),
];

//
