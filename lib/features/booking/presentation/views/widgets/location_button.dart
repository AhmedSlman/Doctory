
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: MediaQuery.of(context).size.width*0.14,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
          color: AppColors.whiteColor,
        ),
        child:const Icon(Icons.location_on_outlined,
          color: AppColors.primaryColor,
          size: 30,

        )
    )
    ;
  }
}
