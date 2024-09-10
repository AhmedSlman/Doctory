
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../view_models/cubit/doctors_booking_cubit.dart';
import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsBookingCubit, DoctorsBookingState>(
      builder: (context, state) {
        if (state is DoctorsBookingLoading) {
          return const CustomCircularProgressIndicator();
        } else if (state is DoctorsBookingFailure) {
          return Center(child: Text('Error: ${state.error}'));
        } else if (state is DoctorsBookingSuccess) {
          final doctors = state.doctors;

          if (doctors.isEmpty) {
            return const Center(child: Text('No doctors available'));
          }

          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: DoctorsListViewItem(doctor: doctor),
              );
            },
          );
        }

        // Default case when the state is DoctorsBookingInitial
        return const Center(child: Text('No data yet'));
      },
    );
  }
}