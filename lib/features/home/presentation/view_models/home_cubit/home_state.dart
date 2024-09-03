import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/categories_model.dart';
import '../../../data/models/offer_model.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}


class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<CategoryModel> categories;
  final List<GridViewItemModel> offers;

  HomeLoaded({required this.categories, required this.offers});
}



class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object> get props => [message];
}

