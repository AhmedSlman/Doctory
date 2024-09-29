import 'package:dartz/dartz.dart';
import 'package:doctory/features/home/data/models/offer_model.dart';
import 'package:doctory/features/home/data/repo/home_repo.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/offer/offer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersCubit extends Cubit<OffersState> {
  final HomeRepo repository;

  OffersCubit(this.repository) : super(OffersInitial());

  Future<void> fetchOffers() async {
    try {
      emit(OffersLoading());
      
      final Either<String, List<OffersModel>> result = await repository.getOffers();
      
      result.fold(
        (failure) => emit(OffersFailure(failure)),
        (categories) => emit(OffersSuccess(categories)),
      );
      
    } catch (e) {
      emit(const OffersFailure("Unexpected Error Occurred"));
    }
  }
}
