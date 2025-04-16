import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';

class LockedContent extends StatelessWidget {
  final bool isLocked;
  final Widget child;
  final VoidCallback? onTap;

  const LockedContent(
      {super.key, required this.isLocked, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusStyle.roundedBorder10,
      child: Stack(
        children: [
          child,
          if (isLocked)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color:
                      theme(context).colorScheme.onPrimaryContainer.withValues(
                            alpha: 0.3,
                          ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock,
                        color: theme(context).colorScheme.onPrimaryContainer,
                        size: 50,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        context.tr("program_screen.content_locked"),
                        style: CustomTextStyles(context).bodySmall12,
                      )
                    ],
                  ),
                ),
              ),
            ),
          if (isLocked && onTap != null)
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor:
                      theme(context).colorScheme.primary.withValues(alpha: 0.5),
                  highlightColor:
                      theme(context).colorScheme.primary.withValues(alpha: 0.2),
                  onTap: onTap,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
