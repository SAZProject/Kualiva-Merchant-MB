import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/style/custom_btn_style.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_outlined_button.dart';
import 'package:kualiva_merchant_mb/edit/widget/edit_outlet_add_tags_modal.dart';

class EditOutletAddTags extends StatefulWidget {
  const EditOutletAddTags({
    super.key,
    required this.listAllTag,
    required this.listSelectedTag,
  });

  final List<String> listAllTag;
  final Set<String> listSelectedTag;

  @override
  State<EditOutletAddTags> createState() => _EditOutletAddTagsState();
}

class _EditOutletAddTagsState extends State<EditOutletAddTags> {
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
              context.tr("edit_outlet.tags"),
              textAlign: TextAlign.center,
              style: theme(context).textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            _buildSelectedTags(context),
            SizedBox(height: 5.h),
            CustomOutlinedButton(
              height: 40.h,
              text: context.tr("common.edit"),
              buttonStyle: CustomButtonStyles.outlinePrimary(context),
              buttonTextStyle: CustomTextStyles(context).bodySmallPrimary12,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => EditOutletAddTagsModal(
                    listAllTag: widget.listAllTag,
                  ),
                ).then(
                  (value) {
                    final String? selectedTag = value as String?;
                    setState(() {
                      if (selectedTag != null && selectedTag != "") {
                        widget.listSelectedTag.add(selectedTag);
                      }
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedTags(BuildContext context) {
    return widget.listSelectedTag.isEmpty
        ? Center(
            child: Text(
              context.tr("edit_outlet.tags_hint"),
              textAlign: TextAlign.center,
              style: theme(context).textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        : Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 10.h,
            spacing: 10.h,
            children: List<Widget>.generate(
              widget.listSelectedTag.length,
              (index) {
                return FittedBox(
                  child: _chipLabel(
                      context, widget.listSelectedTag.elementAt(index)),
                );
              },
            ),
          );
  }

  Widget _chipLabel(BuildContext context, final String label) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: CustomTextStyles(context).bodyMedium_13,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(width: 5.h),
          IconButton(
              onPressed: () {
                setState(() {
                  widget.listSelectedTag.remove(label);
                });
              },
              icon: Icon(
                Icons.cancel_outlined,
                size: 20.h,
              ))
        ],
      ),
    );
  }
}
