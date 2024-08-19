import 'package:doctory/core/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../widgets/save_changes_button.dart';

class SubmitRatingDialog extends StatelessWidget {
  const SubmitRatingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(AppStrings.yourRating, style: AppStyles.sBlack15),
            const SizedBox(height: 10),
            Container(
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
                      const Text(
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
            ),
            const SizedBox(height: 20),
            const SaveChangesButton(),
          ],
        ),
      ),
    );
  }
}
