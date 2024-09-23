import 'package:doctory/core/widgets/custom_circular_progress_indicator.dart';
import 'package:doctory/core/widgets/custom_text_field.dart';
import 'package:doctory/core/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/router_names.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import '../view_models/cubit/auth_cubit.dart';
import '../widgets/forget_password_app_bar.dart';

class EnterYourEmailView extends StatelessWidget {
  const EnterYourEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),
              const ForgetPasswordAppBar1(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              CustomTextField(
                controller: emailController, // Attach the controller
                hintText: S.of(context).email,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset(AppAssets.resetCodeImage),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              // BlocConsumer<AuthCubit, AuthState>(
              //   listener: (context, state) {
              //     if (state is PasswordResetEmailSuccessState) {
              //       // Show success message
              //       showToast(msg: S.of(context).emailSent,
              //           color: AppColors.primaryColor
              //       );
              //     } else if (state is PasswordResetEmailFailureState) {
              //       // Show error message
              //       // ScaffoldMessenger.of(context).showSnackBar(
              //       //   SnackBar(content: Text(state.errMessage)),
              //       // );
              //       showToast(msg: state.errMessage,
              //           color: AppColors.redColor
              //       );
              //     }
              //   },
              //   builder: (context, state) {
              //     if (state is PasswordResetEmailLoadingState) {
              //       return const CustomCircularProgressIndicator();
              //     }
              //     return
              CustomButton(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.07,
                    text: S.of(context).send,
                    onPressed: () {
                      final email = emailController.text.trim();
                      if (email.isNotEmpty) {
                       // cubit.sendPasswordResetEmail(email);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(S.of(context).enterYourEmail)),
                        );
                      }
                    },
                  ),
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordAppBar1 extends StatelessWidget {
  const ForgetPasswordAppBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.go(RouterNames.login);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).forgotPassword,
              style: AppStyles.s18.copyWith(color: AppColors.blackForText),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: S.of(context).enterYourEmail,
                  style: DefaultTextStyle.of(context).style,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
