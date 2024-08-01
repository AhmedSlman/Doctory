import 'package:doctory/core/utils/app_strings.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.03),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Text(AppStrings.booking,
         style: AppStyles.sTitle,
         )
        ],
      ),
    );
  }
}
