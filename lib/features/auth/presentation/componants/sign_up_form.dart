import 'package:doctory/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctory/features/auth/presentation/widgets/auth_text_form_field_widget.dart';
import 'package:doctory/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
          suffixIcon: const Icon(Icons.calendar_month, color: Colors.grey),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1990),
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              authCubit.birthDateController.text =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
            }
          },
        ),
        SizedBox(height: 10.h),
        AuthTextFormFieldWidget(
          hintText: S.of(context).password,
          controller: authCubit.passwordController,
          obscureText: authCubit.obscurePasswordTextValue,
          suffixIcon: SuffixIconWidget(authCubit: authCubit),
        ),
        SizedBox(height: 10.h),
        AuthTextFormFieldWidget(
          hintText: S.of(context).confirmNewPassword,
          controller: authCubit.confirmPasswordController,
          obscureText: authCubit.obscurePasswordTextValue,
          suffixIcon: SuffixIconWidget(authCubit: authCubit),
        ),
      ],
    );
  }
}

class SuffixIconWidget extends StatelessWidget {
  const SuffixIconWidget({
    super.key,
    required this.authCubit,
  });

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        authCubit.obscurePasswordText();
      },
      icon: Icon(
        authCubit.obscurePasswordTextValue == true
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
      ),
    );
  }
}
