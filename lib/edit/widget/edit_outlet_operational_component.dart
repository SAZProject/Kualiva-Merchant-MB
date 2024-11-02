import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/utility/datetime_utils.dart';

class EditOutletOperationalComponent extends StatefulWidget {
  const EditOutletOperationalComponent({
    super.key,
    required this.listOperationalDay,
    required this.listOperationalTimeOpen,
    required this.listOperationalTimeClose,
    required this.selectedDay,
  });

  final List<int> listOperationalDay;
  final List<TimeOfDay> listOperationalTimeOpen;
  final List<TimeOfDay> listOperationalTimeClose;
  final List<bool> selectedDay;

  @override
  State<EditOutletOperationalComponent> createState() =>
      _EditOutletOperationalComponentState();
}

class _EditOutletOperationalComponentState
    extends State<EditOutletOperationalComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.only(bottom: 5.h),
        title: Text(
          context.tr("edit_outlet.operating_hour"),
          style: CustomTextStyles(context).bodyMedium_13,
        ),
        children: widget.listOperationalDay
            .map((index) => _operationalDayHourView(context, index))
            .toList(),
      ),
    );
  }

  Widget _operationalDayHourView(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 14.h,
            width: 14.h,
            child: Checkbox(
              visualDensity: const VisualDensity(
                vertical: -4,
                horizontal: -4,
              ),
              value: widget.selectedDay[index],
              checkColor: theme(context).colorScheme.primary,
              onChanged: (value) {
                setState(() {
                  widget.selectedDay[index] = value!;
                });
              },
            ),
          ),
          SizedBox(
            width: 120.h,
            child: Text(
              DatetimeUtils.getDays(index),
              style: CustomTextStyles(context).bodyMedium_13,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 50.h,
            decoration: CustomDecoration(context).outline,
            child: InkWell(
              onTap: () async {
                await showTimePicker(
                  context: context,
                  initialTime: widget.listOperationalTimeOpen[index],
                ).then(
                  (value) {
                    if (value != null) {
                      setState(() {
                        widget.listOperationalTimeOpen[index] = value;
                      });
                    }
                  },
                );
              },
              child: Text(
                widget.listOperationalTimeOpen[index].format(context),
                style: CustomTextStyles(context).bodyMedium_13,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 20.h,
            child: Text(
              " - ",
              style: CustomTextStyles(context).bodyMedium_13,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 50.h,
            decoration: CustomDecoration(context).outline,
            child: InkWell(
              onTap: () async {
                await showTimePicker(
                  context: context,
                  initialTime: widget.listOperationalTimeClose[index],
                ).then(
                  (value) {
                    if (value != null) {
                      setState(() {
                        widget.listOperationalTimeClose[index] = value;
                      });
                    }
                  },
                );
              },
              child: Text(
                widget.listOperationalTimeClose[index].format(context),
                style: CustomTextStyles(context).bodyMedium_13,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
