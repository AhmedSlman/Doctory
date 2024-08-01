import 'package:doctory/features/booking/presentation/views/widgets/booking_view_body.dart';
import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        body: BookingViewBody(),
      ),
    );
  }
}
