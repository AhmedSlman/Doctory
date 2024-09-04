import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/rating_box.dart';
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
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppStrings.yourRating, style: AppStyles.sBlack15),
            SizedBox(height: 10),
            RatingBox(),
            SizedBox(height: 20),
            SaveChangesButton(cancelOnPressed: () {  }, saveOnPressed: () {  },),
          ],
        ),
      ),
    );
  }
}
