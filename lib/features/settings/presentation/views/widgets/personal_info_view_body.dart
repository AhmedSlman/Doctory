import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/widgets/custom_app_bar.dart';
import 'package:doctory/core/widgets/custom_circular_progress_indicator.dart';
import 'package:doctory/core/widgets/custom_toast.dart';
import 'package:doctory/core/widgets/date_picker.dart';
import 'package:doctory/features/settings/presentation/views/widgets/save_changes_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../view_models/cubit/settings_cubit.dart';

class PersonalInfoViewBody extends StatelessWidget {
  const PersonalInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsCubit = BlocProvider.of<SettingsCubit>(context);
    final userId = FirebaseAuth.instance.currentUser!.uid;
    settingsCubit.getUserData(userId);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is SaveUserDataSuccess) {
            showToast(
              msg: S.of(context).saveEditSuccess,
              color: Colors.green,
            );
            settingsCubit.getUserData(userId);
          } else if (state is SaveUserDataError) {
            showToast(
              msg: S.of(context).saveEditError,
              color: AppColors.redColor,
            );
          }
        },
        builder: (context, state) {
          if (state is GetUserDataLoading) {
            return const CustomCircularProgressIndicator();
          } else if (state is GetUserDataSuccess) {
            final user = state.userModel;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                    title: S.of(context).personalInformation,
                    showBackButton: true),
                const SizedBox(height: 40),
                CustomTextField(
                  hintText: S.of(context).fullName,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: S.of(context).phone,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: S.of(context).email,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: CustomDatePicker(
                        hintText: S.of(context).dateOfBirth,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    const Expanded(
                      child: DropdownTextField(
                        options: [
                          AppStrings.male,
                          AppStrings.female,
                        ],
                        // hintText: user.isMale ? S.of(context).male : S.of(context).female,
                        // // selectedValue: selectedGender,
                        // textStyle: AppStyles.sSubTitleGrey,
                        // onChanged: (value) {
                        //   selectedGender = value!;
                        // },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // SaveChangesButton(
                //   cancelOnPressed: () {
                //     GoRouter.of(context).pop();
                //   },
                //   saveOnPressed: () {
                //     // if (_validateFields(nameController, phoneController, emailController, birthDateController)) {
                //     //   final updatedUser = UserModel(
                //     //     name: nameController.text,
                //     //     phoneNumber: phoneController.text,
                //     //     email: emailController.text,
                //     //     birthDate: birthDateController.text,
                //     //     gender: selectedGender,
                //     //     id: userId,
                //     //   );
                //       settingsCubit.saveUserData(updatedUser);
                //     } else {
                //       showToast(
                //         msg: S.of(context).emptyFieldsMessage,
                //         color: AppColors.redColor,
                //       );
                //     }
                //   },
                // ),
              ],
            );
          } else if (state is GetUserDataError) {
            return const Center(child: Text('Check Your internet connection'));
          }
          return Container();
        },
      ),
    );
  }

  bool _validateFields(
    TextEditingController nameController,
    TextEditingController phoneController,
    TextEditingController emailController,
    TextEditingController birthDateController,
  ) {
    return nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        birthDateController.text.isNotEmpty;
  }
}
