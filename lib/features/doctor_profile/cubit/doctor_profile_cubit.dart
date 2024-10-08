


import 'package:doctory/features/doctor_profile/cubit/doctor_profile_state.dart';
import 'package:doctory/features/doctor_profile/data/repo/doctor_profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsProfileCubit extends Cubit<DoctorsProfileState> {
  final DoctorProfileRepo doctorsRepo;

  DoctorsProfileCubit( {required this.doctorsRepo}) : super(DoctorsProfileInitial());

  // ميثود getDoctors
  Future<void> getDoctors({int? doctorId}) async {
    emit(GetDoctorsProfileLoading());
    final result = await doctorsRepo.getDoctors(doctorId: doctorId );
    result.fold(
      (error) => emit(GetDoctorsProfileFailure(error)),
      (doctors) => emit(GetDoctorsProfileSuccess(doctors)),
    );
  }
}