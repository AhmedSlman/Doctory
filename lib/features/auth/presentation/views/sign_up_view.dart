import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_assets.dart';
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_strings.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/core/widgets/custom_button.dart';
import 'package:doctory/features/auth/presentation/widgets/auth_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLTR = Localizations.localeOf(context).languageCode == 'en';
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Spacer for top padding
              Image.asset(AppAssets.logo),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Align(
                alignment: isLTR ? Alignment.centerLeft : Alignment.centerRight,
                child: Text(
                  S.of(context).createAccount,
                  style: AppStyles.s18.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              AuthTextFormFieldWidget(
                hintText: S.of(context).fullName,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              AuthTextFormFieldWidget(
                hintText: S.of(context).phone,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              AuthTextFormFieldWidget(
                hintText: S.of(context).email,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              AuthTextFormFieldWidget(
                hintText: S.of(context).dateOfBirth,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              AuthTextFormFieldWidget(
                hintText: S.of(context).password,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                children: [
                  Radio(value: 1, groupValue: 1, onChanged: (_) {}),
                  Text(S.of(context).male),
                  Radio(value: 0, groupValue: 1, onChanged: (_) {}),
                  Text(S.of(context).female),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButton(
                text: S.of(context).createAccount,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.07,
                onPressed: () {},
              ),
              TextButton(
                child: Text(
                  S.of(context).login,
                  style: AppStyles.s16,
                ),
                onPressed: () {
                  context.go(RouterNames.login);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Spacer for bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
