import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/utility/datetime_utils.dart';
import 'package:kualiva_merchant_mb/_data/models/outlet_model.dart';

class ChooseOutletListItem extends StatelessWidget {
  const ChooseOutletListItem({
    super.key,
    required this.outletModel,
  });

  final OutletModel outletModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: SizedBox(
        width: double.maxFinite,
        child: Card(
          elevation: 5.0,
          child: InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.editOutletScreen,
              arguments: outletModel,
            ),
            child: Padding(
              padding: EdgeInsets.all(5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          outletModel.outletName,
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
                    outletModel.googlePlaceId,
                    style: theme(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    context.tr("choose_outlet.claimed", namedArgs: {
                      "date": DatetimeUtils.dmy(outletModel.createdAt),
                    }),
                    style: theme(context).textTheme.labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
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
