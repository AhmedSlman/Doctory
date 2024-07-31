import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomCategoriesListViewItem extends StatelessWidget {
  const CustomCategoriesListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: 2.9/2.9,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: AppColors.whiteColor

        ),
      ),
    );
  }
}
