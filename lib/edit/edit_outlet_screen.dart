import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/dataset/outlet_dataset.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';
import 'package:kualiva_merchant_mb/data/models/outlet_model.dart';
import 'package:kualiva_merchant_mb/edit/widget/edit_outlet_add_tags.dart';
import 'package:kualiva_merchant_mb/edit/widget/edit_outlet_dropdown_component.dart';
import 'package:kualiva_merchant_mb/edit/widget/edit_outlet_edit_menu.dart';
import 'package:kualiva_merchant_mb/edit/widget/edit_outlet_operational_component.dart';
import 'package:kualiva_merchant_mb/edit/widget/edit_outlet_textfield_component.dart';

class EditOutletScreen extends StatefulWidget {
  const EditOutletScreen({super.key, required this.outletModel});

  final OutletModel outletModel;

  @override
  State<EditOutletScreen> createState() => _EditOutletScreenState();
}

class _EditOutletScreenState extends State<EditOutletScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _outletNameCtl = TextEditingController();
  final TextEditingController _contactCtl = TextEditingController();
  final TextEditingController _locCtl = TextEditingController();

  final List<String> _listType = OutletDataset.outletType;
  final List<String> _listTag = OutletDataset.outletTags;
  final Set<String> _listSelectedTag = <String>{};

  bool isAgreed = false;

  List<bool> selectedDay = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  void dispose() {
    _outletNameCtl.dispose();
    _contactCtl.dispose();
    _locCtl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _outletNameCtl.text = widget.outletModel.outletName;
    _contactCtl.text = widget.outletModel.phoneBusiness;
    _locCtl.text = widget.outletModel.address;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _editOutletAppBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _editOutletAppBar(BuildContext context) {
    return CustomAppBar(
      title: context.tr("edit_screen.title"),
      centerTitle: true,
      leadingIcon: Icons.arrow_back_ios_new,
      onBackPressed: () => Navigator.pop(context),
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
              EditOutletTextfieldComponent(
                headerLabel: context.tr("edit_outlet.outlet_name"),
                controller: _outletNameCtl,
                hasRequestEdit: true,
              ),
              EditOutletTextfieldComponent(
                headerLabel: context.tr("edit_outlet.contact"),
                controller: _contactCtl,
              ),
              EditOutletTextfieldComponent(
                headerLabel: context.tr("edit_outlet.location"),
                controller: _locCtl,
              ),
              EditOutletDropdownComponent(
                headerLabel: context.tr("edit_outlet.type"),
                items: _listType,
                hintText: context.tr("edit_outlet.type_hint"),
                onChange: (value) {},
              ),
              EditOutletAddTags(
                listAllTag: _listTag,
                listSelectedTag: _listSelectedTag,
              ),
              EditOutletOperationalComponent(
                listOperationalDay: widget.outletModel.operationalDay,
                listOperationalTimeOpen: widget.outletModel.operationalTimeOpen,
                listOperationalTimeClose:
                    widget.outletModel.operationalTimeClose,
                selectedDay: selectedDay,
              ),
              EditOutletEditMenu(
                  listMenuPicture: widget.outletModel.menuPicture),
            ],
          ),
        ),
      ),
    );
  }
}
