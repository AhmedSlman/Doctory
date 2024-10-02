import 'package:doctory/core/services/service_locator.dart';
import 'package:doctory/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctory/features/settings/view_models/profile_cubit/profile_cubit.dart';
import 'package:doctory/features/settings/presentation/views/widgets/personal_info_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getUserData(),
      child: Scaffold(
        body: SafeArea(child: PersonalInfoViewBody()),
      ),
    );
  }
}
