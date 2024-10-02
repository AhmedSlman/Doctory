import 'package:doctory/core/widgets/custom_app_bar.dart';
import 'package:doctory/core/widgets/custom_circular_progress_indicator.dart';
import 'package:doctory/core/widgets/custom_text_field.dart';
import 'package:doctory/core/widgets/custom_toast.dart';
import 'package:doctory/features/settings/data/models/password_model.dart';
import 'package:doctory/features/settings/presentation/views/widgets/save_changes_button.dart';
import 'package:doctory/features/settings/view_models/password_cubit/update_password_cubit.dart';
import 'package:doctory/features/settings/view_models/password_cubit/update_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/l10n.dart';
import '../../../view_models/cubit/settings_cubit.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<PasswordCubit, PasswordState>(
      listener: (context, state) {
        if (state is PasswordSuccess) {
          showToast(msg: state.message, color: Colors.green);
          currentPasswordController.clear();
          newPasswordController.clear();
          confirmPasswordController.clear();

        } else if (state is PasswordFailure) {
          showToast(msg: state.error, color: Colors.red);

        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: S.of(context).changePassword,
                  showBackButton: true,
                ),
                SizedBox(height: screenHeight * 0.03),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: currentPasswordController,
                        hintText: S.of(context).currentPassword,
                        //obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).currentPassword;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextField(
                        controller: newPasswordController,
                        hintText: S.of(context).newPassword,
                        //obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).newPassword;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextField(
                        controller: confirmPasswordController,
                        hintText: S.of(context).confirmNewPassword,
                        //obscureText: true,
                        validator: (value) {
                          if (value != newPasswordController.text) {
                            return 'الباسورد لا ينطبق';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      state is ChangePasswordLoading ? const CustomCircularProgressIndicator()
                      :SaveChangesButton(
                        cancelOnPressed: () {
                          context.pop();
                        },
                        saveOnPressed: () {
                          if (formKey.currentState!.validate()) {
                            final cubit = context.read<PasswordCubit>();
                            cubit.changePassword(PasswordModel(
                              newPassword: newPasswordController.text, 
                              confirmPassword: confirmPasswordController.text,
                              oldPassword: currentPasswordController.text
                              ));
                             
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
