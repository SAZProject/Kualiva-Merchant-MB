import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/data/models/ui_model/account_menu_model.dart';

class AccountMenuSection extends StatelessWidget {
  AccountMenuSection({super.key});

  final List<AccountMenuModel> _accountModel = [
    AccountMenuModel(
      label: "account.theme",
      icon: Icons.brightness_4_outlined,
      isRightIcon: true,
    ),
    AccountMenuModel(
      label: "account.cs",
      icon: Icons.support_agent,
      isRightIcon: false,
    ),
    AccountMenuModel(
      label: "account.about_us",
      imageUri: ImageConstant.appLogo,
      isRightIcon: false,
    ),
    AccountMenuModel(
      label: "account.log_out",
      icon: Icons.logout_outlined,
      isRightIcon: false,
    ),
  ];

  void _accountMenuNavigate(BuildContext context, int index) {
    switch (index) {
      case 1:
        Navigator.pushNamed(context, AppRoutes.helpScreen);
        break;
      case 2:
        break;
      case 3:
        break;
      default:
        final brightness = theme(context).brightness;
        if (brightness == Brightness.light) {
          return AdaptiveTheme.of(context).setDark();
        } else {
          return AdaptiveTheme.of(context).setLight();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = theme(context).brightness;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: SizedBox(
        width: double.maxFinite,
        child: Card(
          color: theme(context).colorScheme.onSecondaryContainer,
          elevation: 10.0,
          child: Column(
            children: [
              _buildProfileMenuListItem(
                context,
                0,
                _accountModel[0].label,
                _accountModel[0].icon,
                _accountModel[0].imageUri,
                _accountModel[0].isRightIcon,
                buildRight: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: child.key == const ValueKey("dark")
                          ? Tween<double>(begin: 1, end: 0.75)
                              .animate(animation)
                          : Tween<double>(begin: 0.75, end: 1)
                              .animate(animation),
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: brightness == Brightness.dark
                      ? Icon(
                          Icons.dark_mode,
                          key: const ValueKey("dark"),
                          size: 20.h,
                        )
                      : Icon(
                          Icons.light_mode,
                          key: const ValueKey("light"),
                          size: 20.h,
                        ),
                ),
              ),
              _buildProfileMenuListItem(
                context,
                1,
                _accountModel[1].label,
                _accountModel[1].icon,
                _accountModel[1].imageUri,
                _accountModel[1].isRightIcon,
              ),
              _buildProfileMenuListItem(
                context,
                2,
                _accountModel[2].label,
                _accountModel[2].icon,
                _accountModel[2].imageUri,
                _accountModel[2].isRightIcon,
              ),
              _buildProfileMenuListItem(
                context,
                3,
                _accountModel[3].label,
                _accountModel[3].icon,
                _accountModel[3].imageUri,
                _accountModel[3].isRightIcon,
                isLogOut: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileMenuListItem(
    BuildContext context,
    int index,
    String label,
    IconData? icon,
    String? imageUri,
    bool isRightIcon, {
    bool isLogOut = false,
    Widget? buildRight,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.5.h),
      child: SizedBox(
        width: double.maxFinite,
        child: ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          leading: icon != null
              ? SizedBox(
                  width: 20.h,
                  height: 20.h,
                  child: Center(
                    child: Icon(
                      icon,
                      size: 20.h,
                      color: isLogOut ? Colors.redAccent : null,
                    ),
                  ),
                )
              : SizedBox(
                  width: 20.h,
                  height: 20.h,
                  child: CustomImageView(
                    imagePath: imageUri ?? "",
                    width: 20.h,
                    height: 20.h,
                    alignment: Alignment.center,
                  ),
                ),
          trailing: isRightIcon ? buildRight : const SizedBox(),
          title: Text(
            context.tr(label),
            style: CustomTextStyles(context).bodyMedium_15.copyWith(
                color: isLogOut
                    ? Colors.redAccent
                    : theme(context).colorScheme.onPrimaryContainer),
          ),
          onTap: () => _accountMenuNavigate(context, index),
        ),
      ),
    );
  }
}
