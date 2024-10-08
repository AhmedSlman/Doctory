import 'package:doctory/features/booking/data/repo/doctors_repo.dart';
import 'package:doctory/features/booking/presentation/view_models/cubit/doctors_booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DoctorsCubit extends Cubit<DoctorsBookingState> {
  final DoctorsRepo doctorsRepo;

  DoctorsCubit( {required this.doctorsRepo}) : super(DoctorsInitial());

  // ميثود getDoctors
  Future<void> getDoctors() async {
    emit(GetDoctorsLoading());
    final result = await doctorsRepo.getDoctors( );
    result.fold(
      (error) => emit(GetDoctorsFailure(error)),
      (doctors) => emit(GetDoctorsSuccess(doctors)),
    );
  }

  // ميثود getDoctorsByCity
  Future<void> getDoctorsByCity(String city) async {
    emit(GetDoctorsByCityLoading());
    final result = await doctorsRepo.getDoctorsByCity(city: city);
    result.fold(
      (error) => emit(GetDoctorsByCityFailure(error)),
      (doctors) => emit(GetDoctorsByCitySuccess(doctors)),
    );
  }

  // ميثود getDoctorsBySpecialization
  Future<void> getDoctorsBySpecialization(String specializationName) async {
    emit(GetDoctorsBySpecializationLoading());
    final result = await doctorsRepo.getDoctorsBySpecialization(specializationName: specializationName);
    result.fold(
      (error) => emit(GetDoctorsBySpecializationFailure(error)),
      (doctors) => emit(GetDoctorsBySpecializationSuccess(doctors)),
    );
  }

  // ميثود filtteredDoctors
  Future<void> filteredDoctors({
    required String specializationName,
    required String city,
  }) async {
    emit(FilteredDoctorsLoading());
    final result = await doctorsRepo.filtteredDoctors(
      specializationName: specializationName,
      city: city,
    );
    result.fold(
      (error) => emit(FilteredDoctorsFailure(error)),
      (doctors) => emit(FilteredDoctorsSuccess(doctors)),
    );
  }
}
