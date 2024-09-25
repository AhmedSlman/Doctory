import 'package:doctory/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctory/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelectionSection extends StatelessWidget {
  const GenderSelectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        children: [
          Radio<Gender>(
            value: Gender.male,
            groupValue: authCubit.selectedGender,
            onChanged: (Gender? value) {
              if (value != null) {
                authCubit.changeGender(value);
              }
            },
          ),
          Text(S.of(context).male),
          Radio<Gender>(
            value: Gender.female,
            groupValue: authCubit.selectedGender,
            onChanged: (Gender? value) {
              if (value != null) {
                authCubit.changeGender(value);
              }
            },
          ),
          Text(S.of(context).female),
        ],
      ),
    );
  }
}
