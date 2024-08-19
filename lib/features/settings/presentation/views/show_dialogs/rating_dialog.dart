import 'package:doctory/features/settings/presentation/views/show_dialogs/submit_rating_dialog.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_rating_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../widgets/report_problem_textfield.dart';

class RatingScreenDialog extends StatelessWidget {
  const RatingScreenDialog({super.key});

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
            const Text(AppStrings.rating, style: AppStyles.sBlack15),
            const SizedBox(height: 5),
            const CustomRatingBar(),
            const SizedBox(height: 8), // Adjusted spacing
            const CustomTextField(
              hintText: 'الاسم',
            ),
            const SizedBox(height: 8), // Adjusted spacing
            ReportTextField(
              contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04, // Adjusted vertical padding
                horizontal: 8,
              ),
              hintText: 'التقييم',
            ),
            const SizedBox(height: 15), // Adjusted spacing
            CustomButton(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.06,
              text: AppStrings.send,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const SubmitRatingDialog();
                  },
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}