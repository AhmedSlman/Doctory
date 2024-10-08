import 'package:doctory/core/services/service_locator.dart';
import 'package:doctory/features/settings/presentation/views/widgets/booking_time_view_body.dart';
import 'package:doctory/features/settings/view_models/get_reserve_cubit/reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingTimeView extends StatelessWidget {
  const BookingTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocProvider(
      create: (context) => getIt<ReservationCubit>()..fetchReservations(),
      child: const BookingTimeViewBody(),
    )));
  }
}
