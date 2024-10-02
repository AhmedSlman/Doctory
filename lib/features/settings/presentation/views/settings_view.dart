import 'package:doctory/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctory/features/settings/view_models/cubit/settings_cubit.dart';
import 'package:doctory/features/settings/presentation/views/widgets/settings_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: const Scaffold(
        body: SafeArea(child: SettingsViewBody()),
      ),
    );
  }
}
