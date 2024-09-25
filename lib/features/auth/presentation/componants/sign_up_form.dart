import 'package:doctory/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctory/features/auth/presentation/widgets/auth_text_form_field_widget.dart';
import 'package:doctory/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return Column(
      children: [
        SizedBox(height: 20.h),
        AuthTextFormFieldWidget(
          hintText: S.of(context).fullName,
          controller: authCubit.nameController,
        ),
        SizedBox(height: 10.h),
        AuthTextFormFieldWidget(
          hintText: S.of(context).email,
          controller: authCubit.emailController,
        ),
        SizedBox(height: 10.h),
        AuthTextFormFieldWidget(
          hintText: S.of(context).phone,
          controller: authCubit.phoneController,
        ),
        SizedBox(height: 10.h),
        AuthTextFormFieldWidget(
          hintText: S.of(context).dateOfBirth,
          controller: authCubit.birthDateController,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime(1900),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              authCubit.birthDateController.text =
                  "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
            }
          },
        ),
        SizedBox(height: 10.h),
        AuthTextFormFieldWidget(
          hintText: S.of(context).password,
          controller: authCubit.passwordController,
          obscureText: authCubit.isSecured,
          suffixIcon: authCubit.togglePass(),
        ),
      ],
    );
  }
}
