import 'package:dartz/dartz.dart';
import 'package:doctory/features/home/data/models/booking_model.dart';
import 'package:doctory/features/home/data/repo/home_repo.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/reserve/reserve_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReserveOfferCubit extends Cubit<ReserveOfferState> {
  final HomeRepo repository;

  ReserveOfferCubit(this.repository) : super(ReserveOfferInitial());

  Future<void> reserveOffer(BookingModel  bookingModel) async {

    emit(ReserveOfferLoading());

    final Either<String, String> result = await repository.reserveOffer(bookingModel);

    result.fold(
      (failure) => emit(ReserveOfferFailure(failure)),
      (success) => emit(ReserveOfferSuccess(success)),
    );
  }
}