import 'package:doctory/core/utils/app_styles.dart';
import 'package:flutter/material.dart';



class CustomCategoriesListViewItem extends StatelessWidget {
  final String name;

  const CustomCategoriesListViewItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white, // Replace with AppColors.whiteColor if you have it defined
        ),
        child: Center(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: AppStyles.sPrimaryColor14, // Ensure AppStyles.sPrimaryColor14 is defined
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
