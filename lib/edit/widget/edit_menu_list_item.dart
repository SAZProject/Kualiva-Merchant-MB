import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';

class EditMenuListItem extends StatelessWidget {
  const EditMenuListItem({
    super.key,
    required this.imagePath,
    required this.menuTitle,
    required this.menuDesc,
    required this.menuPrice,
  });

  final String imagePath;
  final String menuTitle;
  final String menuDesc;
  final String menuPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: SizedBox(
        width: double.maxFinite,
        child: Card(
          elevation: 5.0,
          child: Padding(
            padding: EdgeInsets.all(5.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  imagePath: imagePath,
                  width: 120.h,
                  height: 70.h,
                  boxFit: BoxFit.cover,
                  radius: BorderRadiusStyle.roundedBorder10,
                ),
                SizedBox(width: 5.h),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              menuTitle,
                              style: theme(context).textTheme.labelLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            PopupMenuButton(
                              position: PopupMenuPosition.under,
                              padding: EdgeInsets.zero,
                              iconSize: 10.h,
                              itemBuilder: (ctx) => [
                                _buildPopupMenuItem(context, 0, Icons.reply),
                              ],
                              child: const Icon(
                                Icons.more_vert,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        menuDesc,
                        style: theme(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        context.tr("edit_menu.menu_price", namedArgs: {
                          "price": menuPrice,
                        }),
                        style: theme(context).textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      BuildContext context, int index, IconData icon) {
    return PopupMenuItem(
      padding: EdgeInsets.zero,
      height: 0.0,
      onTap: () {},
      value: index,
      child: Center(child: Icon(icon, size: 25.h)),
    );
  }
}
