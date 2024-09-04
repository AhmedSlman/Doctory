import 'package:doctory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';

class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton({super.key, required this.cancelOnPressed, required this.saveOnPressed,});
  final VoidCallback cancelOnPressed;
  final VoidCallback saveOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: S.of(context).save,
            onPressed: saveOnPressed,
            height: MediaQuery.of(context).size.height* 0.065,
            width: double.infinity,
          ),
        ),
        Expanded(
          child: CustomButton(
            text: S.of(context).cancel,
            textColor:AppColors.primaryColor,
            onPressed: cancelOnPressed,
            height: MediaQuery.of(context).size.height* 0.065,
            width: double.infinity,
            buttonColor: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
