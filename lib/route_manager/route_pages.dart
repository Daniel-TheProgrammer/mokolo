import 'package:get/get.dart';
import 'package:mokolo/common_widgets/bottom_navbar.dart';
import 'package:mokolo/view/auth_screens/login.dart';
import 'package:mokolo/view/auth_screens/otp_screen.dart';
import 'package:mokolo/view/auth_screens/start_screen.dart';
import 'package:mokolo/view/home/home.dart';
import 'package:mokolo/view/loader/splash_screen.dart';
import 'package:mokolo/view/profile_screens/edit_profile.dart';
import 'package:mokolo/view/profile_screens/profile_settings.dart';
import '../view/profile_screens/profile_sceen.dart';
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
    ),
    GetPage(
      name: RouteName.bottomNavRoute,
      page: () => const BottomNavBar(),
      transition: transition,
      transitionDuration: duration,
    ),
    GetPage(
      name: RouteName.accountRoute,
      page: () => const AccountScreen(),
      transition: transition,
      transitionDuration: duration,
    ),
    GetPage(
      name: RouteName.profileEditRoute,
      page: () => const EditProfile(),
      transition: transition,
      transitionDuration: duration,
    ),
    GetPage(
      name: RouteName.profileSettingsRoute,
      page: () => const ProfileSettings(),
      transition: transition,
      transitionDuration: duration,
    ),
  ];
}
