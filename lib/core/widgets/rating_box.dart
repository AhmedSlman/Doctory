import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'custom_rating_bar.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'محمد احمد',
                    style: AppStyles.sBlack12.copyWith(color: AppColors.primaryColor),
                  ),
                  const SizedBox(width: 10),
                  const CustomRatingBar(),
                ],
              ),
              const SizedBox(height: 4),
               Text(
                'دكتور ممتاز',
                style: AppStyles.sBlack12,
                overflow: TextOverflow.visible,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              '20-08-2024',
              style: AppStyles.s10.copyWith(color: AppColors.greyForIcon),
            ),
          ),
        ],
      ),
    );
  }
}
