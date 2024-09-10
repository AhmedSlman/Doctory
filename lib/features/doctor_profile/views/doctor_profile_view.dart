import 'package:doctory/features/doctor_profile/views/widgets/doctor_profile_view_body.dart';
import 'package:flutter/material.dart';

import '../../booking/data/models/doctor_model.dart';

class DoctorProfileInfoView extends StatelessWidget {
  const DoctorProfileInfoView({super.key, required this.doctor});
  final DoctorModel doctor;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: DoctorProfileViewBody(doctor: doctor,)),
    );
  }
}
