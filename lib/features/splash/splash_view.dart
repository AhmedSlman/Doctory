import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_assets.dart';
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_strings.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.whiteColor,
            AppColors.scaffoldColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              AppStrings.welcome,
              style: AppStyles.s18,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Image.asset(AppAssets.logo),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Image.asset(AppAssets.onPoardingimage),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            CustomButton(
              text: AppStrings.letsStart,
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.07,
              onPressed: () {
                context.go(RouterNames.login);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
