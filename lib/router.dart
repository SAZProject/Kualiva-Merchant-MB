import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/auth/sign_in_screen.dart';
import 'package:kualiva_merchant_mb/common/screen/coming_soon.dart';
import 'package:kualiva_merchant_mb/splash/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static const String splashScreen = "/splash_screen";

  static const String signInScreen = "/sign_in_screen";

  static const String mainLayout = "/main_layout";
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
    default:
      return PageTransition(
        child: const ComingSoon(),
        type: PageTransitionType.rightToLeft,
        alignment: Alignment.center,
      );
  }
}
