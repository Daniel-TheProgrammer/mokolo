import 'package:get/get.dart';
import 'package:mokolo/view/auth_screens/login.dart';
import 'package:mokolo/view/auth_screens/otp_screen.dart';
import 'package:mokolo/view/auth_screens/start_screen.dart';
import 'package:mokolo/view/home/home.dart';
import 'package:mokolo/view/loader/splash_screen.dart';

import 'route_names.dart';

const duration = Duration(milliseconds: 500);
const transition = Transition.cupertino;

class RoutesPages {
  static List<GetPage> routes = [
    GetPage(
      name: RouteName.splashRoute,
      page: () => const SplashScreen(),
      transition: transition,
      transitionDuration: duration,
    ),
    GetPage(
      name: RouteName.loginRoute,
      page: () => Login(),
      transition: transition,
      transitionDuration: duration,
    ),
    GetPage(
      name: RouteName.startRoute,
      page: () => const StartScreen(),
      transition: transition,
      transitionDuration: duration,
    ),
    GetPage(
      name: RouteName.otpRoute,
      page: () => OtpScreen(),
      transition: transition,
      transitionDuration: duration,
    ),
    GetPage(
      name: RouteName.homeRoute,
      page: () => const HomeScreen(),
      transition: transition,
      transitionDuration: duration,
    )
  ];
}
