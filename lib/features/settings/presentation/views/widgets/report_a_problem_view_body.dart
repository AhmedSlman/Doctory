
import 'package:doctory/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class ReportAProblemViewBody extends StatelessWidget {
  const ReportAProblemViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child:  const Column(
        children: [
          CustomAppBar(title: AppStrings.reportAProblem,showBackButton: true,),
        ],
      ),
    );
  }
}
