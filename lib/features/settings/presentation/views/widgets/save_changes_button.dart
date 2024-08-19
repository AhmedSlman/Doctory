import 'package:doctory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'حفظ',
            onPressed: () {},
            height: MediaQuery.of(context).size.height* 0.065,
            width: double.infinity,
          ),
        ),
        Expanded(
          child: CustomButton(
            text: 'الغاء',
            textColor:AppColors.primaryColor,
            onPressed: () {},
            height: MediaQuery.of(context).size.height* 0.065,
            width: double.infinity,
            buttonColor: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
