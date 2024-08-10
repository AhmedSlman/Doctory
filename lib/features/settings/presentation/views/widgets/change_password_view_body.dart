import 'package:doctory/core/widgets/custom_app_bar.dart';
import 'package:doctory/core/widgets/custom_text_field.dart';
import 'package:doctory/features/settings/presentation/views/widgets/save_changes_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: AppStrings.changePassword),
          SizedBox(height: screenHeight * 0.03),
          const CustomTextField(
            hintText: AppStrings.currentPassword,
          ),
          SizedBox(height: screenHeight * 0.02),
          const CustomTextField(
            hintText: AppStrings.changePassword,
          ),
          SizedBox(height: screenHeight * 0.02),
          const CustomTextField(
            hintText: AppStrings.confirmNewPassword,
          ),
          SizedBox(height: screenHeight * 0.05),
          const SaveChangesButton(),
        ],
      ),
    );
  }
}
