import 'package:dartz/dartz.dart';
import 'package:doctory/features/home/data/models/categories_model.dart';
import 'package:doctory/features/home/data/repo/home_repo.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/category/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo repository;

  CategoriesCubit(this.repository) : super(CategoriesInitial());

  Future<void> fetchCategories() async {
    try {
      emit(CategoriesLoading());
      
      final Either<String, List<CategoryModel>> result = await repository.getCategories();
      
      result.fold(
        (failure) => emit(CategoriesFailure(failure)),
        (categories) => emit(CategoriesSuccess(categories)),
      );
      
    } catch (e) {
      emit(const CategoriesFailure("Unexpected Error Occurred"));
    }
  }
}
