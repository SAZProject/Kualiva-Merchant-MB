import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_drop_down.dart';

class EditOutletDropdownComponent extends StatelessWidget {
  const EditOutletDropdownComponent({
    super.key,
    required this.headerLabel,
    required this.items,
    required this.hintText,
    this.onChange,
  });

  final String headerLabel;
  final List<String> items;
  final String hintText;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headerLabel,
              textAlign: TextAlign.center,
              style: theme(context).textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            CustomDropDown(
              icon: Container(
                margin: EdgeInsets.only(left: 16.h),
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 26.h,
                ),
              ),
              iconSize: 26.h,
              hintText: hintText,
              items: items,
              contentPadding: EdgeInsets.all(10.h),
              onChange: onChange,
            ),
          ],
        ),
      ),
    );
  }
}
