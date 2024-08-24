import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/features/settings/presentation/views/widgets/settings_button_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../generated/l10n.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              CustomAppBar(title:S.of(context).settings,),
             SettingsContainer(title: S.of(context).personalInformation,
              onTap: () => GoRouter.of(context).push(RouterNames.personalInfoView),),
            const SizedBox(
              height: 18,
            ),
             SettingsContainer(title: S.of(context).changePassword,
              onTap: () =>GoRouter.of(context).push(RouterNames.changePasswordView),),
            const SizedBox(
              height: 18,
            ),
             SettingsContainer(title:S.of(context).bookingTime,
               onTap: () =>GoRouter.of(context).push(RouterNames.bookingTime),),
            const SizedBox(
              height: 18,
            ),
             SettingsContainer(title: S.of(context).sendProblem,
               onTap: () =>GoRouter.of(context).push(RouterNames.reportProblemView),),
        
            TextButton(onPressed: (){}, child:Text(S.of(context).logOut,
              style: AppStyles.sBlack15.copyWith(
                  color: AppColors.redColor
              ),))
          ],
        ),
      ),
    );
  }
}
