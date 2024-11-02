import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';

class EditOutletEditMenu extends StatelessWidget {
  const EditOutletEditMenu({super.key, required this.listMenuPicture});

  final List<String> listMenuPicture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, AppRoutes.editMenuScreen,
            arguments: listMenuPicture),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.settings,
                size: 20.h,
              ),
              Text(
                context.tr("edit_outlet.manage_menu"),
                textAlign: TextAlign.center,
                style: theme(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
