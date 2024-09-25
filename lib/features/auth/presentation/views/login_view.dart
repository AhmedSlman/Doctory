import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_assets.dart';
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/core/widgets/custom_button.dart';
import 'package:doctory/features/auth/presentation/widgets/auth_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../../generated/l10n.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLTR = Localizations.localeOf(context).languageCode == 'en';

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignInLoadingState) {
          } else if (state is SignInFailureState) {
            showToast(msg: state.errMessage, color: AppColors.redColor);
          } else if (state is SignInSuccessState) {
            showToast(msg: S.of(context).loggedIn, color: Colors.green);
            context.go(RouterNames.bottomNavBar);
          }
        },
        builder: (context, state) {
          return Container(
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Align(
                    alignment:
                        isLTR ? Alignment.centerLeft : Alignment.centerRight,
                    child: Text(
                      S.of(context).login,
                      style:
                          AppStyles.s18.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  AuthTextFormFieldWidget(
                    hintText: S.of(context).email,
                    controller: context.read<AuthCubit>().emailController,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  AuthTextFormFieldWidget(
                    hintText: S.of(context).password,
                    controller: context.read<AuthCubit>().passwordController,
                    // obscureText: context.read<AuthCubit>().isSecured,
                    // suffixIcon: context.read<AuthCubit>().togglePass(),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.go(RouterNames.enterYourEmail);
                      },
                      child: Text(S.of(context).forgotPassword),
                    ),
                  ),
                  state is SignInLoadingState
                      ? const CustomCircularProgressIndicator()
                      : CustomButton(
                          text: S.of(context).login,
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.07,
                          onPressed: () {
                            final email =
                                context.read<AuthCubit>().emailController!.text;
                            final password = context
                                .read<AuthCubit>()
                                .passwordController!
                                .text;
                            context
                                .read<AuthCubit>()
                                .sigInUser(email: email, password: password);
                          },
                        ),
                  TextButton(
                    child: Text(
                      S.of(context).createAccount,
                      style: AppStyles.s16,
                    ),
                    onPressed: () {
                      context.go(RouterNames.signup);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
