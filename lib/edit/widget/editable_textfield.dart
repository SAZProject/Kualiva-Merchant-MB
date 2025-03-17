import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_text_form_field.dart';

class EditableTextfield extends StatelessWidget {
  const EditableTextfield({
    super.key,
    required this.headerLabel,
    required this.controller,
    required this.textInputType,
    this.suffix,
    required this.textfieldFocus,
    required this.textfieldReadOnly,
    this.editOnPressed,
  });

  final String headerLabel;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? suffix;
  final FocusNode textfieldFocus;
  final bool textfieldReadOnly;
  final Function()? editOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headerLabel,
              textAlign: TextAlign.center,
              style: theme(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            CustomTextFormField(
              controller: controller,
              focusNode: textfieldFocus,
              contentPadding: EdgeInsets.all(12.h),
              readOnly: textfieldReadOnly,
              textInputType: textInputType,
              textInputAction: TextInputAction.done,
              suffix: suffix != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.h),
                            child: InkWell(
                              onTap: editOnPressed,
                              child: Text(
                                context.tr(textfieldReadOnly
                                    ? "common.edit"
                                    : "common.confirm"),
                                style: CustomTextStyles(context)
                                    .bodySmall12
                                    .copyWith(
                                      color: textfieldReadOnly
                                          ? theme(context).colorScheme.primary
                                          : theme(context)
                                              .colorScheme
                                              .primaryContainer,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
