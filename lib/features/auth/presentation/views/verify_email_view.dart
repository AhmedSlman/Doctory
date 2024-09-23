import 'package:doctory/core/utils/app_assets.dart';
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/core/widgets/custom_text_field.dart';
import 'package:doctory/features/auth/presentation/view_models/cubit/auth_cubit.dart';
import 'package:doctory/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/router_names.dart';
import '../../../../core/widgets/custom_button.dart';
import '../view_models/cubit/auth_state.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),
              Text(
                S.of(context).verifyEmail,
                style: AppStyles.s18.copyWith(color: AppColors.blackForText),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: S.of(context).pinCodeMessage,
                    style: DefaultTextStyle.of(context).style,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              CustomTextField(
                controller: cubit.otpController, // Attach the controller
                hintText: S.of(context).otpCode,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset(AppAssets.resetCodeImage),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),

              // BlocConsumer to handle the different states
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is OTPVerifiedState) {
                    // Show success message when OTP is verified
                    ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text("تم تـاكيد حسابك")),
                     
                    );
                  context.go(RouterNames.bottomNavBar);
                  } else if (state is OTPFailedState) {
                    // Show error message if OTP verification failed
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is OTPLoadingState) {
                    // Show loading indicator while verifying OTP
                    return const CircularProgressIndicator();
                  }
                  return CustomButton(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.07,
                    text: S.of(context).send,
                    onPressed: () {
                      if (cubit.otpController.text.isNotEmpty) {
                        cubit.verifyEmail(
                         // cubit.emailController.text,
                         // cubit.otpController.text,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text("يرجي ادخال قيمه")),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
