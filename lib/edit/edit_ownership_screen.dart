import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/utility/sized_utils.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_snack_bar.dart';
import 'package:kualiva_merchant_mb/data/dio_client.dart';
import 'package:kualiva_merchant_mb/data/shared_pref_collection.dart';
import 'package:kualiva_merchant_mb/edit/widget/editable_textfield.dart';

class EditOwnershipScreen extends StatefulWidget {
  const EditOwnershipScreen({super.key});

  @override
  State<EditOwnershipScreen> createState() => _EditOwnershipScreenState();
}

class _EditOwnershipScreenState extends State<EditOwnershipScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullnameCtl = TextEditingController();
  final TextEditingController _contactCtl = TextEditingController();
  final FocusNode _fulnameFocus = FocusNode();
  final FocusNode _contactFocus = FocusNode();
  bool isLoading = false;
  bool _fullnameReadOnly = true;
  bool _contactReadOnly = true;
  String accId = "";
  String tempFullNameValue = "";
  String tempContactValue = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    Map<String, dynamic> getProfile = await PrefUtils.getProfile();
    accId = getProfile["id"];
    tempFullNameValue = _fullnameCtl.text = getProfile["username"];
    tempContactValue = _contactCtl.text = getProfile["phone"];
  }

  @override
  void dispose() {
    _fullnameCtl.dispose();
    _contactCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _editOwnershipAppBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _editOwnershipAppBar(BuildContext context) {
    return CustomAppBar(
      title: context.tr("edit_screen.edit_ownership"),
      centerTitle: true,
      leadingIcon: Icons.arrow_back_ios_new,
      onBackPressed: () => Navigator.pop(context),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.h),
          child: IconButton(
            icon: Icon(
              Icons.search,
              size: 25.h,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              EditableTextfield(
                headerLabel: context.tr("edit_screen.fullname"),
                controller: _fullnameCtl,
                textInputType: TextInputType.text,
                suffix: context.tr("common.edit"),
                textfieldFocus: _fulnameFocus,
                textfieldReadOnly: _fullnameReadOnly,
                editOnPressed: () async {
                  setState(() {
                    _fullnameReadOnly = !_fullnameReadOnly;
                    if (_fullnameReadOnly == false) {
                      _fulnameFocus.requestFocus();
                    }
                  });
                  if (_fullnameReadOnly) {
                    if (_fullnameCtl.text != tempFullNameValue) {
                      Map<String, String> body = {
                        "username": _fullnameCtl.text.trim(),
                        "email": "",
                        "phone": _contactCtl.text.trim(),
                        "password": ""
                      };
                      final dio = await DioClient().dio();
                      final res = await dio.post('/users-merchant/login',
                          queryParameters: {"id": accId}, data: body);
                      Map<String, dynamic> mapRes = jsonDecode(res.toString());
                      if (mapRes["status"] == 200) {
                        setState(() {
                          isLoading = false;
                        });
                        Map<String, dynamic> mapData =
                            jsonDecode(mapRes["data"].toString());
                        PrefUtils.setProfile(mapData.toString());
                        if (!context.mounted) return;
                        showSnackBar(
                            context,
                            Icons.done_outline,
                            Colors.greenAccent,
                            context.tr("sign_in.sign_in_success"),
                            Colors.greenAccent);
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                        if (!context.mounted) return;
                        showSnackBar(context, Icons.error_outline, Colors.red,
                            context.tr("sign_in.sign_in_failed"), Colors.red);
                      }
                    }
                  }
                },
              ),
              SizedBox(height: 10.h),
              EditableTextfield(
                headerLabel: context.tr("edit_screen.contact"),
                controller: _contactCtl,
                textInputType: TextInputType.phone,
                suffix: context.tr("common.edit"),
                textfieldFocus: _contactFocus,
                textfieldReadOnly: _contactReadOnly,
                editOnPressed: () {
                  setState(() {
                    _contactReadOnly = !_contactReadOnly;
                    if (_contactReadOnly == false) {
                      _contactFocus.requestFocus();
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
