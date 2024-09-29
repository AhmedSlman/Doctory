import 'package:doctory/features/home/data/models/offer_model.dart';
import 'package:equatable/equatable.dart';

abstract class OffersBySpecState extends Equatable {
  const OffersBySpecState();

  @override
  List<Object?> get props => [];
}

class OffersBySpacInitial extends OffersBySpecState {}

class OffersBySpacLoading extends OffersBySpecState {}

class OffersBySpacSuccess extends OffersBySpecState {
  final List<OffersModel> offer;

  const OffersBySpacSuccess(this.offer);

  @override
  List<Object?> get props => [offer];
}

class OffersBySpacFailure extends OffersBySpecState {
  final String error;

  const OffersBySpacFailure(this.error);

  @override
  List<Object?> get props => [error];
}
