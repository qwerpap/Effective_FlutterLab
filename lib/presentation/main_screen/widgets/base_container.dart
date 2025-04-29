import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppSizes.baseBorderRadius),
      ),
      child: child,
    );
  }
}
