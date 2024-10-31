import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/account/about_us_screen.dart';
import 'package:kualiva_merchant_mb/account/help_screen.dart';
import 'package:kualiva_merchant_mb/auth/sign_in_screen.dart';
import 'package:kualiva_merchant_mb/common/screen/coming_soon.dart';
import 'package:kualiva_merchant_mb/home/home_screen.dart';
import 'package:kualiva_merchant_mb/layout/main_layout.dart';
import 'package:kualiva_merchant_mb/splash/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static const String splashScreen = "/splash_screen";

  static const String signInScreen = "/sign_in_screen";

  static const String mainLayout = "/main_layout";

  static const String homeScreen = "/home_screen";

  static const String helpScreen = "/help_screen";

  static const String aboutUsScreen = "/about_us_screen";
}

Route<dynamic> generateRoute(RouteSettings routeSetting) {
  switch (routeSetting.name) {
    case AppRoutes.splashScreen:
      return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center);
    case AppRoutes.signInScreen:
      return PageTransition(
          child: const SignInScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center);
    case AppRoutes.mainLayout:
      return PageTransition(
          child: const MainLayout(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center);
    case AppRoutes.homeScreen:
      return PageTransition(
          child: const HomeScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center);
    case AppRoutes.helpScreen:
      return PageTransition(
          child: const HelpScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center);
    case AppRoutes.aboutUsScreen:
      return PageTransition(
          child: const AboutUsScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center);
    default:
      return PageTransition(
        child: const ComingSoon(),
        type: PageTransitionType.rightToLeft,
        alignment: Alignment.center,
      );
  }
}
