import 'package:doctory/core/services/service_locator.dart';
import 'package:doctory/features/doctor_profile/cubit/doctor_profile_cubit.dart';
import 'package:doctory/features/doctor_profile/views/widgets/doctor_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorProfileInfoView extends StatelessWidget {
  const DoctorProfileInfoView({super.key, required this.doctorId});
  final int doctorId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) {
          final cubit = getIt<DoctorsProfileCubit>();
          cubit.getDoctors(doctorId: doctorId);
          return cubit;
        },
        child: const DoctorProfileViewBody(),
      )),
    );
  }
}
