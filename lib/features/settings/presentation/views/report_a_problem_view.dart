import 'package:doctory/features/settings/view_models/cubit/settings_cubit.dart';
import 'package:doctory/features/settings/presentation/views/widgets/report_a_problem_view_body.dart';
import 'package:doctory/features/settings/view_models/problam_cubit/problam_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';

class ReportAProblemView extends StatelessWidget {
  const ReportAProblemView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReportProblemCubit>(),
      child: const Scaffold(
          body: SafeArea(child: ReportAProblemViewBody())
      ),
    );
  }
}
