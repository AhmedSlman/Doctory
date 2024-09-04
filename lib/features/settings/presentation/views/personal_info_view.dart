import 'package:doctory/core/services/service_locator.dart';
import 'package:doctory/features/settings/presentation/view_models/cubit/settings_cubit.dart';
import 'package:doctory/features/settings/presentation/views/widgets/personal_info_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingsCubit>(),
      child: const Scaffold(
        body: SafeArea(child: PersonalInfoViewBody()),
      ),
    );
  }
}
