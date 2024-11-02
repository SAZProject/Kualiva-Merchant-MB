import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_text_form_field.dart';

class EditOutletTextfieldComponent extends StatelessWidget {
  const EditOutletTextfieldComponent({
    super.key,
    required this.headerLabel,
    required this.controller,
    this.hasRequestEdit = false,
  });

  final String headerLabel;
  final TextEditingController controller;
  final bool? hasRequestEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  headerLabel,
                  textAlign: TextAlign.center,
                  style: theme(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 5.h),
                Visibility(
                  visible: hasRequestEdit!,
                  child: Text(
                    context.tr("edit_outlet.req_edit"),
                    textAlign: TextAlign.center,
                    style: CustomTextStyles(context).bodySmall10.copyWith(
                          color: theme(context).colorScheme.primary,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            CustomTextFormField(
              controller: controller,
              textInputAction: TextInputAction.done,
              readOnly: hasRequestEdit,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 14.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
