import 'package:doctory/features/settings/data/models/reserve_model.dart';

abstract class ReservationState {}

class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationLoaded extends ReservationState {
  final List<Appointment> appointments;

  ReservationLoaded(this.appointments);
}

class ReservationError extends ReservationState {
  final String message;

  ReservationError(this.message);
}
