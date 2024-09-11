import 'package:doctory/features/settings/presentation/views/widgets/booking_time_view_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../view_models/cubit/settings_cubit.dart';

class BookingTimeView extends StatelessWidget {
  const BookingTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingsCubit>()..getBookedOffers(FirebaseAuth.instance.currentUser!.uid),
      child: Scaffold(
        body: SafeArea(child: BookingTimeViewBody(
          userId: FirebaseAuth.instance.currentUser!.uid,)),
      ),
    );
  }
}
