import 'package:doctory/core/error/error_model.dart';
import '../data/model/doctor_profile_model.dart';

abstract class DoctorsProfileState {}

class DoctorsProfileInitial extends DoctorsProfileState {}

// حالات getDoctors
class GetDoctorsProfileLoading extends DoctorsProfileState {}

class GetDoctorsProfileSuccess extends DoctorsProfileState {
  final DoctorProfileModel doctors;

  GetDoctorsProfileSuccess(this.doctors);
}

class GetDoctorsProfileFailure extends DoctorsProfileState {
  final ErrorModel error;

  GetDoctorsProfileFailure(this.error);
}
