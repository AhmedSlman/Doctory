import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CustomContainerCard extends StatelessWidget {
  const CustomContainerCard({super.key, required this.title, required this.content, this.height});
  final String title;
  final Widget content;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.sBlack15,
            ),
            SizedBox(height: 10.h),
            content,

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
