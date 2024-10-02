import 'package:doctory/core/widgets/custom_app_bar.dart';
import 'package:doctory/core/widgets/custom_toast.dart';
import 'package:doctory/core/widgets/date_picker.dart';
import 'package:doctory/features/settings/data/models/profile_model.dart';
import 'package:doctory/features/settings/view_models/profile_cubit/profile_cubit.dart';
import 'package:doctory/features/settings/view_models/profile_cubit/profile_state.dart';
import 'package:doctory/features/settings/presentation/views/widgets/save_changes_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../generated/l10n.dart';

class PersonalInfoViewBody extends StatelessWidget {
  PersonalInfoViewBody({super.key});

  // تعريف المتحكمات
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? emailController;
  TextEditingController? birthDateController;
  TextEditingController? genderController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is GetUserDataLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetUserDataError) {
            return Center(
              child: Text('Error: ${state.errorMsg}'),
            );
          } else if (state is GetUserDataSuccess) {
            final profile = state.profile;

            // تهيئة المتحكمات فقط عندما تكون القيم فارغة (أي لأول مرة)
            nameController ??= TextEditingController(text: profile.name);
            phoneController ??= TextEditingController(text: profile.phone);
            emailController ??= TextEditingController(text: profile.email);
            birthDateController ??= TextEditingController(text: profile.birthdate.toString());
            genderController ??= TextEditingController(
                text: profile.isMale ? AppStrings.male : AppStrings.female);

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                      title: S.of(context).personalInformation,
                      showBackButton: true),
                  const SizedBox(height: 40),
                  CustomTextField(
                    controller: nameController,
                    hintText: S.of(context).fullName,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: phoneController,
                    hintText: S.of(context).phone,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: emailController,
                    hintText: S.of(context).email,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: CustomDatePicker(
                          controller: birthDateController,
                          hintText: S.of(context).dateOfBirth,
                          initialDate: profile.birthdate, // تعيين تاريخ الميلاد
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: DropdownTextField(
                          controller: genderController,
                          options: const [
                            AppStrings.male,
                            AppStrings.female,
                          ],
                          initialValue: profile.isMale == 0
                              ? AppStrings.male
                              : AppStrings.female,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60.h),
              
                  // BlocListener لسماع حالة Cubit وتحديث الزر بناءً عليها
                  BlocListener<ProfileCubit, ProfileState>(
                    listener: (context, state) {
                      if (state is UserUpdatedSuccess) {
                        showToast(msg: "Profile updated successfully", color: Colors.green);
                      } else if (state is UserUpdatedError) {
                        showToast(msg: state.errorMsg, color: Colors.red);
                      }
                    },
                    child: BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        bool isLoading = state is UserUpdatedLoading;
              
                        return SaveChangesButton(
                          isLoading: isLoading, // يتحكم في عرض مؤشر التحميل
                          cancelOnPressed: () {
                            GoRouter.of(context).pop();
                          },
                          saveOnPressed: () {
                            // التحقق من أن النص ليس فارغًا قبل التحديث
                            context.read<ProfileCubit>().updateUser(
                                Profile(
                                    id: profile.id,
                                    name: nameController!.text.isNotEmpty
                                        ? nameController!.text
                                        : profile.name,
                                    email: emailController!.text.isNotEmpty
                                        ? emailController!.text
                                        : profile.email,
                                    phone: phoneController!.text.isNotEmpty
                                        ? phoneController!.text
                                        : profile.phone,
                                    isMale: profile.isMale, 
                                    birthdate: profile.birthdate,
                                    createdAt: profile.createdAt,
                                    updatedAt: DateTime.now(), 
                                ));
                                  if (state is UserUpdatedSuccess) {
                                    GoRouter.of(context).pop();
                                                                  showToast(msg: "Update You Profile", color: Colors.green);
              
                                  }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}