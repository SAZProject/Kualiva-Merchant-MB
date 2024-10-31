import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_text_form_field.dart';

class ReviewListItem extends StatefulWidget {
  const ReviewListItem({
    super.key,
    required this.index,
    required this.imagePath,
    required this.username,
    required this.reviewContent,
    required this.publishDate,
    required this.ratingScore,
  });

  final String index;
  final String imagePath;
  final String username;
  final String reviewContent;
  final String publishDate;
  final String ratingScore;

  @override
  State<ReviewListItem> createState() => _ReviewListItemState();
}

class _ReviewListItemState extends State<ReviewListItem> {
  bool isExpanded = false;
  final TextEditingController _replyCtl = TextEditingController();

  void _popUpMenuAction(BuildContext context, int index) {
    switch (index) {
      default:
        setState(() {
          isExpanded = true;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isExpanded ? 120.h : 80.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Dismissible(
              key: Key(widget.index),
              direction: isExpanded
                  ? DismissDirection.none
                  : DismissDirection.endToStart,
              background: Container(
                color: theme(context).colorScheme.primary,
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.reply,
                      size: 20.h,
                    ),
                  ),
                ),
              ),
              confirmDismiss: (direction) {
                setState(() {
                  isExpanded = true;
                });
                return Future.value(false);
              },
              child: SizedBox(
                height: 80.h,
                child: Card(
                  elevation: 5.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 50.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                imagePath: widget.imagePath,
                                width: 30.h,
                                height: 30.h,
                                boxFit: BoxFit.cover,
                                radius: BorderRadiusStyle.roundedBorder50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 15.h,
                                    color: theme(context).colorScheme.primary,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.h),
                                    child: Text(
                                      widget.ratingScore,
                                      style:
                                          CustomTextStyles(context).bodySmall10,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5.h),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.h, right: 5.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                child: Row(
                                  children: [
                                    Text(
                                      widget.username,
                                      style:
                                          CustomTextStyles(context).bodySmall12,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Spacer(),
                                    Text(
                                      widget.publishDate,
                                      style:
                                          CustomTextStyles(context).bodySmall12,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    isExpanded
                                        ? IconButton(
                                            iconSize: 15.h,
                                            visualDensity:
                                                VisualDensity.compact,
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              setState(() {
                                                isExpanded = false;
                                              });
                                            },
                                            icon: const Icon(Icons.cancel),
                                          )
                                        : PopupMenuButton(
                                            position: PopupMenuPosition.under,
                                            padding: EdgeInsets.zero,
                                            iconSize: 10.h,
                                            itemBuilder: (ctx) => [
                                              _buildPopupMenuItem(
                                                  context, 0, Icons.reply),
                                            ],
                                            child: const Icon(
                                              Icons.more_vert,
                                            ),
                                          )
                                  ],
                                ),
                              ),
                              Text(
                                widget.reviewContent,
                                style: CustomTextStyles(context).bodySmall10,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isExpanded ? 30.h : 0.0,
              child: Visibility(
                visible: isExpanded,
                child: CustomTextFormField(
                  controller: _replyCtl,
                  height: 30.h,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  contentPadding: EdgeInsets.all(12.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      BuildContext context, int index, IconData icon) {
    return PopupMenuItem(
      padding: EdgeInsets.zero,
      height: 0.0,
      onTap: () => _popUpMenuAction(context, index),
      value: index,
      child: Center(child: Icon(icon, size: 25.h)),
    );
  }
}
