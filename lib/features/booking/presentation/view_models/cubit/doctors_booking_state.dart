part of 'doctors_booking_cubit.dart';


sealed class DoctorsBookingState extends Equatable {
  const DoctorsBookingState();

  @override
  List<Object?> get props => [];
}

final class DoctorsBookingInitial extends DoctorsBookingState {}

final class DoctorsBookingLoading extends DoctorsBookingState {}

final class DoctorsBookingSuccess extends DoctorsBookingState {
  final List<DoctorModel> doctors;

  const DoctorsBookingSuccess(this.doctors);

  @override
  List<Object?> get props => [doctors];
}

final class DoctorsBookingFailure extends DoctorsBookingState {
  final String error;

  const DoctorsBookingFailure(this.error);

  @override
  List<Object?> get props => [error];
}
