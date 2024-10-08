
import 'package:doctory/core/error/error_model.dart';
import 'package:doctory/features/booking/data/models/doctor_model.dart';

abstract class DoctorsBookingState {}

// الحالة الافتراضية
class DoctorsInitial extends DoctorsBookingState {}

// حالات getDoctors
class GetDoctorsLoading extends DoctorsBookingState {}

class GetDoctorsSuccess extends DoctorsBookingState {
  final List<DoctorModel> doctors;

  GetDoctorsSuccess(this.doctors);
}

class GetDoctorsFailure extends DoctorsBookingState {
  final ErrorModel error;

  GetDoctorsFailure(this.error);
}

// حالات getDoctorsByCity
class GetDoctorsByCityLoading extends DoctorsBookingState {}

class GetDoctorsByCitySuccess extends DoctorsBookingState {
  final List<DoctorModel> doctors;

  GetDoctorsByCitySuccess(this.doctors);
}

class GetDoctorsByCityFailure extends DoctorsBookingState {
  final ErrorModel error;

  GetDoctorsByCityFailure(this.error);
}

// حالات getDoctorsBySpecialization
class GetDoctorsBySpecializationLoading extends DoctorsBookingState {}

class GetDoctorsBySpecializationSuccess extends DoctorsBookingState {
  final List<DoctorModel> doctors;

  GetDoctorsBySpecializationSuccess(this.doctors);
}

class GetDoctorsBySpecializationFailure extends DoctorsBookingState {
  final ErrorModel error;

  GetDoctorsBySpecializationFailure(this.error);
}

// حالات filtteredDoctors
class FilteredDoctorsLoading extends DoctorsBookingState {}

class FilteredDoctorsSuccess extends DoctorsBookingState {
  final List<DoctorModel> doctors;

  FilteredDoctorsSuccess(this.doctors);
}

class FilteredDoctorsFailure extends DoctorsBookingState {
  final ErrorModel error;

  FilteredDoctorsFailure(this.error);
}
