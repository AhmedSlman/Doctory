import 'package:doctory/features/settings/presentation/views/widgets/booking_time_view_body.dart';
import 'package:flutter/material.dart';

class BookingTimeView extends StatelessWidget {
  const BookingTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BookingTimeViewBody()),
    );
  }
}
