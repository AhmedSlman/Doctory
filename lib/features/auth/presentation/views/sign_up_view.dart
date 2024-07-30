import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_assets.dart';
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_strings.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/core/widgets/custom_button.dart';
import 'package:doctory/features/auth/presentation/widgets/auth_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logo),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppStrings.createAccount,
                  style: AppStyles.s18.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const AuthTextFormFieldWidget(
                hintText: AppStrings.fullName,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const AuthTextFormFieldWidget(
                hintText: AppStrings.phone,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const AuthTextFormFieldWidget(
                hintText: AppStrings.email,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const AuthTextFormFieldWidget(
                hintText: AppStrings.dateOfBirth,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const AuthTextFormFieldWidget(
                hintText: AppStrings.password,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                children: [
                  Radio(value: 1, groupValue: 1, onChanged: (_) {}),
                  const Text("ذكر"),
                  Radio(value: 0, groupValue: 1, onChanged: (_) {}),
                  const Text("أنثي"),
                ],
              ),
              CustomButton(
                text: AppStrings.createAccount,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.07,
                onPressed: () {},
              ),
              TextButton(
                child: const Text(
                  AppStrings.login,
                  style: AppStyles.s16,
                ),
                onPressed: () {
                  context.go(RouterNames.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
