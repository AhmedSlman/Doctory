import 'package:doctory/features/home/data/models/offer_model.dart';
import 'package:equatable/equatable.dart';

abstract class OffersState extends Equatable {
  const OffersState();

  @override
  List<Object?> get props => [];
}

class OffersInitial extends OffersState {}

class OffersLoading extends OffersState {}

class OffersSuccess extends OffersState {
  final List<OffersModel> offer;

  const OffersSuccess(this.offer);

  @override
  List<Object?> get props => [offer];
}

class OffersFailure extends OffersState {
  final String error;

  const OffersFailure(this.error);

  @override
  List<Object?> get props => [error];
}
