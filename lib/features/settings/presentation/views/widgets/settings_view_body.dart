import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/features/settings/presentation/views/widgets/settings_button_container.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const CustomAppBar(title:AppStrings.settings),
          const SettingsContainer(title: AppStrings.personalInformation,),
          const SizedBox(
            height: 18,
          ),
          const SettingsContainer(title: AppStrings.changePassword,),
          const SizedBox(
            height: 18,
          ),
          const SettingsContainer(title: AppStrings.bookingTime,),
          const SizedBox(
            height: 18,
          ),
          const SettingsContainer(title: AppStrings.sendProblem,),

          TextButton(onPressed: (){}, child:Text(AppStrings.logOut,
            style: AppStyles.sBlack15.copyWith(
                color: AppColors.redColor
            ),))
        ],
      ),
    );
  }
}
