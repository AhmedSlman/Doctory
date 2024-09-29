import 'package:dartz/dartz.dart';
import 'package:doctory/features/home/data/models/offer_model.dart';
import 'package:doctory/features/home/data/repo/home_repo.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/offers_by_specialization/offers_by_specialization_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersBySpecCubit extends Cubit<OffersBySpecState> {
  final HomeRepo repository;

  OffersBySpecCubit(this.repository) : super(OffersBySpacInitial());

  Future<void> fetchOffersBySpecialization(String specializationName) async {
    try {
      emit(OffersBySpacLoading());
      
      final Either<String, List<OffersModel>> result = await repository.getOffersBySpecialization(specializationName);
      
      result.fold(
        (failure) => emit(OffersBySpacFailure(failure)),
        (offers) => emit(OffersBySpacSuccess(offers)),
      );
    } catch (e) {
      emit(const OffersBySpacFailure("Unexpected Error Occurred"));
    }
  }
}