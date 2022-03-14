import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app_update/ui/themes/app_theme.dart';

class BlurContainer extends StatelessWidget {
  final Widget? child;
  const BlurContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 16,
          sigmaY: 16,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppTheme.clearBoxBg,
          ),
          child: child,
        ),
      ),
    );
  }
}
