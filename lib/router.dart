import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/screen/coming_soon.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static const String splashScreen = "/splash_screen";
}

Route<dynamic> generateRoute(RouteSettings routeSetting) {
  switch (routeSetting.name) {
    case AppRoutes.splashScreen:
      return PageTransition(
        child: const ComingSoon(),
        type: PageTransitionType.rightToLeft,
        alignment: Alignment.center,
      );
    default:
      return PageTransition(
        child: const ComingSoon(),
        type: PageTransitionType.rightToLeft,
        alignment: Alignment.center,
      );
  }
}
