
import 'package:dartz/dartz.dart';
import 'package:doctory/features/settings/data/models/reserve_model.dart';
import 'package:doctory/features/settings/data/repo/settings_repo.dart';
import 'package:doctory/features/settings/view_models/get_reserve_cubit/reservation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final SettingsRepo reservationRepository;

  ReservationCubit(this.reservationRepository) : super(ReservationInitial());

  Future<void> fetchReservations() async {
    try {
      emit(ReservationLoading());  // عند بدء جلب البيانات

      Either<String, List<Appointment>> result = await reservationRepository.getReserve();

      result.fold(
        (error) => emit(ReservationError(error)), // في حالة وجود خطأ
        (appointments) => emit(ReservationLoaded(appointments)), // في حالة النجاح
      );
    } catch (e) {
      emit(ReservationError('Unexpected error occurred: $e'));
    }
  }
}