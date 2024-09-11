import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';


class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    this.height,
    this.width,
    this.radius = 8,
    this.baseColor,
    this.highlightColor,
    this.containerColor,
  });

  final double? height, width, radius;
  final Color? baseColor, highlightColor, containerColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade300,
      highlightColor: highlightColor ?? Colors.grey.shade100,
      child: Container(
        height: height ?? 20,
        width: width,
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: containerColor ?? AppColors.shimmerBaseColor,
          borderRadius: BorderRadius.all(Radius.circular(radius!)),
        ),
      ),
    );
  }
}