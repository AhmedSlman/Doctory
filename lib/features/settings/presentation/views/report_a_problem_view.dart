
import 'package:doctory/features/settings/presentation/views/widgets/report_a_problem_view_body.dart';
import 'package:flutter/material.dart';

class ReportAProblemView extends StatelessWidget {
  const ReportAProblemView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:SafeArea(child:ReportAProblemViewBody())
    );
  }
}
