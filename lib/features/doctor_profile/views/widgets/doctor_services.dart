import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class DoctorServices extends StatelessWidget {
  const DoctorServices({super.key, required this.services});

  final List<String> services;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // Horizontal spacing between items
      runSpacing: 8.0, // Vertical spacing between rows
      children: services.map((service) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            service,
            style: AppStyles.sBlack12,
          ),
        );
      }).toList(),
    );
  }
}
