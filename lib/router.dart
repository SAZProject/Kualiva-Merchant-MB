import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/account/about_us_screen.dart';
import 'package:kualiva_merchant_mb/account/help_screen.dart';
import 'package:kualiva_merchant_mb/auth/sign_in_screen.dart';
import 'package:kualiva_merchant_mb/common/screen/coming_soon.dart';
import 'package:kualiva_merchant_mb/common/screen/notification_screen.dart';
import 'package:kualiva_merchant_mb/common/screen/term_of_service_screen.dart';
import 'package:kualiva_merchant_mb/data/models/outlet_model.dart';
import 'package:kualiva_merchant_mb/edit/choose_outlet_screen.dart';
import 'package:kualiva_merchant_mb/edit/edit_menu_screen.dart';
import 'package:kualiva_merchant_mb/edit/edit_outlet_screen.dart';
import 'package:kualiva_merchant_mb/edit/edit_ownership_screen.dart';
import 'package:kualiva_merchant_mb/edit/edit_screen.dart';
import 'package:kualiva_merchant_mb/home/home_screen.dart';
import 'package:kualiva_merchant_mb/layout/main_layout.dart';
import 'package:kualiva_merchant_mb/program/dine_in_program_screen.dart';
import 'package:kualiva_merchant_mb/program/reward_program_screen.dart';
import 'package:kualiva_merchant_mb/splash/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static const String splashScreen = "/splash_screen";

  static const String signInScreen = "/sign_in_screen";

  static const String tosScreen = "/t_o_s_screen";

  static const String mainLayout = "/main_layout";

  static const String homeScreen = "/home_screen";

  static const String rewardProgramScreen = "/reward_program_screen";

  static const String dineInProgramScreen = "/dine_in_program_screen";

  static const String notifScreen = "/notif_screen";

  static const String helpScreen = "/help_screen";

  static const String aboutUsScreen = "/about_us_screen";

  static const String editScreen = "/edit_screen";

  static const String editOwnershipScreen = "/edit_ownership_screen";

  static const String chooseOutletScreen = "/choose_outlet_screen";

  static const String editOutletScreen = "/edit_outlet_screen";

  static const String editMenuScreen = "/edit_menu_screen";
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
    case AppRoutes.tosScreen:
      return PageTransition(
          child: TermOfServiceScreen(),
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
    case AppRoutes.rewardProgramScreen:
      return PageTransition(
          child: RewardProgramScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center);
    case AppRoutes.dineInProgramScreen:
      final isSystemActiveNotif = routeSetting.arguments as ValueNotifier<bool>;
      return PageTransition(
          child: DineInProgramScreen(isSystemActiveNotif: isSystemActiveNotif),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center);
    case AppRoutes.notifScreen:
      return PageTransition(
          child: const NotificationScreen(),
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
    case AppRoutes.editScreen:
      return PageTransition(
          child: const EditScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center);
    case AppRoutes.editOwnershipScreen:
      return PageTransition(
          child: const EditOwnershipScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center);
    case AppRoutes.chooseOutletScreen:
      return PageTransition(
          child: const ChooseOutletScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center);
    case AppRoutes.editOutletScreen:
      final outletModel = routeSetting.arguments as OutletModel;
      return PageTransition(
          child: EditOutletScreen(outletModel: outletModel),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center);
    case AppRoutes.editMenuScreen:
      final listMenu = routeSetting.arguments as List<String>;
      return PageTransition(
          child: EditMenuScreen(listMenuPicture: listMenu),
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
