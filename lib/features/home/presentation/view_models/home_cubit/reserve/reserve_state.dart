import 'package:equatable/equatable.dart';

abstract class ReserveOfferState extends Equatable {
  @override
  List<Object> get props => [];
}

class ReserveOfferInitial extends ReserveOfferState {}

class ReserveOfferLoading extends ReserveOfferState {}

class ReserveOfferSuccess extends ReserveOfferState {
  final String message;

  ReserveOfferSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class ReserveOfferFailure extends ReserveOfferState {
  final String error;

  ReserveOfferFailure(this.error);

  @override
  List<Object> get props => [error];
}
