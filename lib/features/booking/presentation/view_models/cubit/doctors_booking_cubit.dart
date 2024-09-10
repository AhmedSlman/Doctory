import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/doctor_model.dart';
import '../../../data/repo/doctors_repo.dart';

part 'doctors_booking_state.dart';

class DoctorsBookingCubit extends Cubit<DoctorsBookingState> {
  final DoctorsRepo _doctorsRepo;

  DoctorsBookingCubit(this._doctorsRepo) : super(DoctorsBookingInitial());

  Future<void> fetchDoctors() async {
    try {
      emit(DoctorsBookingLoading());
      final doctors = await _doctorsRepo.fetchDoctors();
      emit(DoctorsBookingSuccess(doctors));
    } catch (error) {
      emit(DoctorsBookingFailure(error.toString()));
    }
  }
}