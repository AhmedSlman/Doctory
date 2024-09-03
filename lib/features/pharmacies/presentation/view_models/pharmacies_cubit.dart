import 'package:bloc/bloc.dart';
import 'package:doctory/features/pharmacies/presentation/view_models/pharmacies_state.dart';

import '../../data/repo/pharmacies_repo.dart';


class PharmaciesCubit extends Cubit<PharmaciesState> {
  final PharmaciesRepo pharmaciesRepo;
  PharmaciesCubit(this.pharmaciesRepo) : super(const PharmaciesInitial());

  Future<void> getPharmacies() async {
    try {
      emit(const PharmaciesLoading());

      final pharmacies = await pharmaciesRepo.getPharmacies();

      emit(PharmaciesLoadedSuccess(pharmacies: pharmacies));
    } catch (e) {
      emit(const PharmaciesError("Failed to fetch home data"));
    }
  }

}
