// ignore_for_file: library_private_types_in_public_api

import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_assets.dart';
import 'package:doctory/core/widgets/custom_button.dart';
import 'package:doctory/core/widgets/custom_text_field.dart';
import 'package:doctory/features/auth/presentation/view_models/cubit/auth_state.dart';
import 'package:doctory/features/auth/presentation/widgets/forget_password_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/l10n.dart';
import '../view_models/cubit/auth_cubit.dart';


class VerificationPage extends StatelessWidget {
  VerificationPage({super.key});

  final _controllers = List.generate(6, (_) => TextEditingController());
  final _focusNodes = List.generate(6, (_) => FocusNode());
  String? verificationId;

  TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is OTPSentState) {
            verificationId = state.verificationId;
          } else if (state is OTPVerifiedState) {
            context.go(RouterNames.changePassword);
          } else if (state is OTPFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error), // Display the specific error
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is OTPLoadingState) {
            return const Center(
              child: CircularProgressIndicator(), // Show loading while sending OTP
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  const ForgetPasswordAppBar(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  // ResetCodeFormWidget(
                  //   controllers: _controllers,
                  //   focusNodes: _focusNodes,
                  // ),
                  CustomTextField(
                    controller: textEditingController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Image.asset(AppAssets.resetCodeImage),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.07,
                    text: S.of(context).send,
                    onPressed: () {
                      final otp = textEditingController.text.trim(); // Get the OTP text

                      if (verificationId != null) {
                        print('Verification ID: $verificationId');
                        print('Entered OTP: $otp');
                      //  authCubit.verifyOtp(verificationId!, otp);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Verification ID is missing. Please wait for the OTP to be sent.'),
                          ),
                        );
                      }
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
