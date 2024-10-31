import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.height,
    this.shape,
    this.leadingWidth,
    this.leadingIcon = Icons.arrow_back_ios_new,
    this.leadingIconColor,
    this.title,
    this.actions,
    this.onBackPressed,
  });

  final double? height;
  final ShapeBorder? shape;
  final double? leadingWidth;
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: height ?? 50.h,
      titleSpacing: 0.0,
      centerTitle: false,
      leading: Padding(
        padding: EdgeInsets.only(left: 5.h),
        child: IconButton(
          iconSize: 25.h,
          icon: Icon(
            leadingIcon,
            color: leadingIconColor,
          ),
          onPressed: onBackPressed,
        ),
      ),
      title: title == null
          ? null
          : Padding(
              padding: EdgeInsets.zero,
              child: Text(
                title ?? "",
                style: theme(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(Sizeutils.width, height ?? 60.h);
}
