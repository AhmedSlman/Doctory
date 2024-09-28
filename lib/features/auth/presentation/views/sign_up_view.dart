import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/core/widgets/custom_button.dart';
import 'package:doctory/core/widgets/custom_circular_progress_indicator.dart';
import 'package:doctory/core/widgets/custom_toast.dart';
import 'package:doctory/features/auth/presentation/componants/app_logo_section.dart';
import 'package:doctory/features/auth/presentation/componants/gender_selection_section.dart';
import 'package:doctory/features/auth/presentation/componants/sign_up_form.dart';
import 'package:doctory/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctory/features/auth/presentation/cubit/auth_state.dart';
import 'package:doctory/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final isLTR = Localizations.localeOf(context).languageCode == 'en';
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is RegisterSuccessState) {
          showToast(msg: "تم التسجيل بنجاح", color: Colors.green);
          context.go(RouterNames.bottomNavBar);
        } else if (state is RegisterFailureState) {
          showToast(msg: state.errMessage, color: Colors.red);
        }
      }, builder: (context, state) {
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
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.h),
            child: Column(
              children: [
                SizedBox(height: 80.h),
                const AppLogoSection(),
                SizedBox(height: 20.h),
                Align(
                  alignment:
                      isLTR ? Alignment.centerLeft : Alignment.centerRight,
                  child: Text(
                    S.of(context).createAccount,
                    style: AppStyles.s18.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                const SignUpFormSection(),
                const GenderSelectionSection(),
                SizedBox(height: 20.h),
                if (state is RegisterLoadingState)
                  const CustomCircularProgressIndicator()
                else
                  CustomButton(
                    text: S.of(context).createAccount,
                    height: 30.h,
                    onPressed: () {
                      authCubit.signUp(
                        name: authCubit.nameController.text,
                        email: authCubit.emailController!.text,
                        password: authCubit.passwordController!.text,
                        phone: authCubit.phoneController.text,
                        passwordConfirmation:
                            authCubit.confirmPasswordController!.text,
                        isMale: true,
                        birthdate: DateTime.now(),
                      );
                      context.go(RouterNames.verifyEmail,
                          extra: authCubit.emailController.text);
                    },
                  ),
                SizedBox(height: 20.h),
                TextButton(
                  child: Text(
                    S.of(context).login,
                  ),
                  onPressed: () {
                    context.go(RouterNames.login);
                  },
                ),
                SizedBox(height: 80.h),
              ],
            ),
          ),
        );
      }),
    );
  }
}
