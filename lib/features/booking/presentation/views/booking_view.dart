import 'package:doctory/features/booking/presentation/view_models/cubit/doctors_booking_cubit.dart';
import 'package:doctory/features/booking/presentation/views/widgets/booking_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DoctorsBookingCubit>(),
      child: const SafeArea(
        child: Scaffold(
          body: BookingViewBody(),
        ),
      ),
    );
  }
}
