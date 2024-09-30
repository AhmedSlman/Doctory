import 'package:equatable/equatable.dart';
import '../../data/models/pharmacies_model.dart';


sealed class PharmaciesState extends Equatable {
  const PharmaciesState();

  @override
  List<Object?> get props => [];
}

final class PharmaciesInitial extends PharmaciesState {}


class PharmaciesLoading extends PharmaciesState {}
class PharmaciesSuccess extends PharmaciesState {
  final List<PharmacyModel> pharmacies;

  const PharmaciesSuccess({required this.pharmacies}); 

  @override
  List<Object?> get props => [pharmacies];
}
class PharmaciesError extends PharmaciesState {
  final String message;

  const PharmaciesError(this.message); 

  @override
  List<Object?> get props => [message];
}
