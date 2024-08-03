import 'package:doctory/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomCategoriesListViewItem extends StatelessWidget {
  const CustomCategoriesListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: 1.1,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: AppColors.whiteColor

        ),
        child: Center(
          child:  Text(
            ' نساء و توليد ',
            textAlign: TextAlign.center,
            style: AppStyles.sPrimaryColor14,

          ),
        ),
      ),
    );
  }
}
