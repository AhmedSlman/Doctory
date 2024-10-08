import 'package:doctory/features/booking/presentation/view_models/cubit/doctors_booking_cubit.dart';
import 'package:doctory/features/booking/presentation/view_models/cubit/doctors_booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsBookingState>(
      builder: (context, state) {
        if (state is GetDoctorsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetDoctorsFailure) {
          return Center(
            child: Text(state.error.message),
          );
        } else if (state is GetDoctorsSuccess) {
          return ListView.builder(
            itemCount: state.doctors.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: DoctorsListViewItem(
                  doctor: state.doctors[index],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('حدثت مشكله تحقق من الانترنت'),
          );
        }
      },
    );
  }
}
