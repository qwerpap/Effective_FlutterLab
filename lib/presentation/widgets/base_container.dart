import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({super.key, required this.child, this.width, this.height});

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
