import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/home_repo.dart';
import 'home_state.dart';




class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> getHomeData() async {
    try {
      emit(HomeLoading());

      final categories = await homeRepo.getCategories();
      final offers = await homeRepo.getOffers();

      if (!isClosed) {
        emit(HomeLoaded(categories: categories, offers: offers));
      }
    } catch (e) {
      if (!isClosed) {
        emit(HomeError("Failed to fetch home data"));
      }
    }
  }
}
