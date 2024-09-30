import 'package:dartz/dartz.dart';
import 'package:doctory/features/pharmacies/data/models/pharmacies_model.dart';
import 'package:doctory/features/pharmacies/presentation/view_models/pharmacies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/pharmacies_repo.dart';


class PharmaciesCubit extends Cubit<PharmaciesState> {
  final PharmaciesRepo pharmaciesRepo;
  PharmaciesCubit(this.pharmaciesRepo) : super( PharmaciesInitial());

  Future<void> getPharmacies() async {
    try {
      emit( PharmaciesLoading());

      final Either<String, List<PharmacyModel>>  pharmacies = await pharmaciesRepo.getPharmacies();
        pharmacies.fold(
          (failure) => emit(PharmaciesError(failure)),
        (pharmacy) => emit(PharmaciesSuccess(pharmacies:pharmacy )),
        );
    } catch (e) {
      emit(const PharmaciesError("Failed to fetch home data"));
    }
  }

}
