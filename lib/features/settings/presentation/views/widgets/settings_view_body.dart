import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/features/settings/presentation/views/widgets/settings_button_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
           SettingsContainer(title: AppStrings.personalInformation,
            onTap: () => GoRouter.of(context).push(RouterNames.personalInfoView),),
          const SizedBox(
            height: 18,
          ),
           SettingsContainer(title: AppStrings.changePassword,
            onTap: () =>GoRouter.of(context).push(RouterNames.changePasswordView),),
          const SizedBox(
            height: 18,
          ),
           SettingsContainer(title: AppStrings.bookingTime,
             onTap: () =>GoRouter.of(context).push(RouterNames.bookingTime),),
          const SizedBox(
            height: 18,
          ),
           SettingsContainer(title: AppStrings.sendProblem,
             onTap: () =>GoRouter.of(context).push(RouterNames.reportProblemView),),

          TextButton(onPressed: (){}, child:Text(AppStrings.logOut,
            style: AppStyles.sBlack15.copyWith(
                color: AppColors.redColor
            ),))
        ],
      ),
    );
  }
}
