import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/review/widget/review_filters_modal.dart';

class ReviewFilters extends StatefulWidget {
  const ReviewFilters({super.key});

  @override
  State<ReviewFilters> createState() => _ReviewFiltersState();
}

class _ReviewFiltersState extends State<ReviewFilters> {
  List<String> menuFilter = [
    "review.filter_time",
    "review.filter_media",
    "review.filter_rating",
  ];

  ValueNotifier<String> selectedStar = ValueNotifier<String>("");

  @override
  void dispose() {
    selectedStar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      runSpacing: 10.h,
      spacing: 10.h,
      children: List<Widget>.generate(
        menuFilter.length,
        (index) {
          return InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => const ReviewFiltersModal(),
              ).then(
                (value) {
                  if (value == null) return;
                  debugPrint(value.toString());
                  List<String?> resVal = value as List<String?>;
                  for (int i = 0; i < resVal.length; i++) {
                    if (resVal[i] != null) {
                      setState(() {
                        menuFilter[i] = resVal[i]!;
                      });
                    }
                  }
                },
              );
            },
            child: FittedBox(
              child: Card(
                color: theme(context).colorScheme.onSecondaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                  side: BorderSide(
                      color: theme(context).colorScheme.onPrimaryContainer),
                ),
                clipBehavior: Clip.hardEdge,
                elevation: 5.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
                  child: Center(
                    child: Row(
                      children: [
                        index == 2
                            ? Icon(
                                Icons.star,
                                size: 20.h,
                                color: theme(context).colorScheme.primary,
                              )
                            : const SizedBox(),
                        Text(
                          context.tr(menuFilter[index]),
                          textAlign: TextAlign.center,
                          style: theme(context).textTheme.bodyMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
