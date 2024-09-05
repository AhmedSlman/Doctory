import 'package:doctory/features/settings/presentation/view_models/cubit/settings_cubit.dart';
import 'package:doctory/features/settings/presentation/views/widgets/change_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingsCubit>(),
      child: const Scaffold(
        body: SafeArea(child: ChangePasswordViewBody()),
      ),
    );
  }
}
