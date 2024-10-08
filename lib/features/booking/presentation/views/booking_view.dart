import 'package:doctory/core/services/service_locator.dart';
import 'package:doctory/features/booking/presentation/view_models/cubit/doctors_booking_cubit.dart';
import 'package:doctory/features/booking/presentation/views/widgets/booking_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<DoctorsCubit>()..getDoctors(),
          child: const BookingViewBody(),
        ),
      ),
    );
  }
}
