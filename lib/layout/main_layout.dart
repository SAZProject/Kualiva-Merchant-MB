import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/screen/coming_soon.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(context),
        bottomNavigationBar: _bottomNavBar(),
      ),
    );
  }

  Widget _body(BuildContext context) {
    switch (_selectedPage) {
      case 0:
        return const ComingSoon();
      case 1:
        return const ComingSoon();
      case 2:
        return const ComingSoon();
      case 3:
        return const ComingSoon();
      case 4:
        return const ComingSoon();
      default:
        return const ComingSoon();
    }
  }

  Widget _bottomNavBar() {
    return CurvedNavigationBar(
      index: _selectedPage,
      backgroundColor: Colors.transparent,
      color: theme(context).colorScheme.onSecondaryContainer,
      buttonBackgroundColor: appTheme.amber700,
      items: [
        _bottomNavBarItems(
          context,
          index: 0,
          label: context.tr("home_nav_bar.nav_1"),
          selectedIcon: Icons.home,
          unselectedIcon: Icons.home_outlined,
        ),
        _bottomNavBarItems(
          context,
          index: 1,
          label: context.tr("home_nav_bar.nav_2"),
          selectedImage: ImageConstant.navBarItem2Sel,
          unselectedImage: ImageConstant.navBarItem2,
          imageDark: ImageConstant.navBarItem2Dark,
        ),
        _bottomNavBarItems(
          context,
          index: 2,
          label: context.tr("home_nav_bar.nav_3"),
          selectedIcon: Icons.star,
          unselectedIcon: Icons.star_border,
        ),
        _bottomNavBarItems(
          context,
          index: 3,
          label: context.tr("home_nav_bar.nav_4"),
          selectedIcon: Icons.person,
          unselectedIcon: Icons.person_outline,
        ),
      ],
      onTap: (value) {
        setState(() {
          _selectedPage = value;
        });
      },
    );
  }

  Widget _bottomNavBarItems(
    BuildContext context, {
    required int index,
    required String label,
    IconData? unselectedIcon,
    IconData? selectedIcon,
    String? unselectedImage,
    String? selectedImage,
    String? imageDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: unselectedIcon != null,
          child: Icon(
            _selectedPage == index ? selectedIcon : unselectedIcon,
            size: 30.h,
            color: _selectedPage == index
                ? appTheme.black900
                : theme(context).iconTheme.color,
          ),
        ),
        Visibility(
          visible: unselectedImage != null,
          child: Image.asset(
            _selectedPage == index
                ? selectedImage ?? "-"
                : theme(context).brightness == Brightness.dark
                    ? imageDark ?? "-"
                    : unselectedImage ?? "-",
            fit: BoxFit.cover,
            width: 30.h,
            height: 30.h,
          ),
        ),
        Visibility(
          visible: _selectedPage == index,
          child: Center(
            child: Text(
              label,
              style: theme(context).textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
