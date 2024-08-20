import 'package:doctory/features/doctor_profile/views/widgets/doctor_profile_view_body.dart';
import 'package:flutter/material.dart';

class DoctorProfileInfoView extends StatelessWidget {
  const DoctorProfileInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: DoctorProfileViewBody()),
    );
  }
}
