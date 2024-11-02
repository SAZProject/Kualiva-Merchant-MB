import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/utility/sized_utils.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_drop_down.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_elevated_button.dart';

class EditOutletAddTagsModal extends StatefulWidget {
  const EditOutletAddTagsModal({super.key, required this.listAllTag});

  final List<String> listAllTag;

  @override
  State<EditOutletAddTagsModal> createState() => _EditOutletAddTagsModalState();
}

class _EditOutletAddTagsModalState extends State<EditOutletAddTagsModal> {
  String selectedTag = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SizedBox(
          width: double.maxFinite,
          height: Sizeutils.height,
          child: _body(context),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
              hintText: context.tr("edit_outlet.tags_hint"),
              items: widget.listAllTag,
              contentPadding: EdgeInsets.all(10.h),
              onChange: (value) {
                setState(() {
                  selectedTag = value;
                });
              },
            ),
            SizedBox(height: 10.h),
            CustomElevatedButton(
              height: 40.h,
              initialText: context.tr("common.confirm"),
              onPressed: () => Navigator.pop(context, selectedTag),
            ),
          ],
        ),
      ),
    );
  }
}
