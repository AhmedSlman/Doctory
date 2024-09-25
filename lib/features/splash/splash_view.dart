import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_assets.dart';
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../generated/l10n.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // super.initState();
    // _checkLoginStatusAndNavigate();
  }

  Future<bool> isUserLoggedIn() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    return user != null;
  }

  // Future<void> _checkLoginStatusAndNavigate() async {
  //   context.go(RouterNames.login);
  //   // bool loggedIn = await isUserLoggedIn();
  //   // if (loggedIn) {
  //   //   context.go(RouterNames.bottomNavBar);
  //   // } else {
  //   //   context.go(RouterNames.login);
  //   // }
  // }

  // @override
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
              S.of(context).welcome,
              style: AppStyles.s18,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Image.asset(AppAssets.logo),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Image.asset(AppAssets.onPoardingimage),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            CustomButton(
              text: S.of(context).letsStart,
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
