import 'package:equatable/equatable.dart';
import '../../data/models/pharmacies_model.dart';


sealed class PharmaciesState extends Equatable {
  const PharmaciesState();

  @override
  List<Object?> get props => [];
}

final class PharmaciesInitial extends PharmaciesState {
  const PharmaciesInitial(); // Mark as const

  @override
  List<Object?> get props => [];
}


class PharmaciesLoading extends PharmaciesState {
  const PharmaciesLoading(); // Mark as const

  @override
  List<Object?> get props => [];
}
class PharmaciesLoadedSuccess extends PharmaciesState {
  final List<PharmaciesModel> pharmacies;

  const PharmaciesLoadedSuccess({required this.pharmacies}); // Mark as const

  @override
  List<Object?> get props => [pharmacies];
}
class PharmaciesError extends PharmaciesState {
  final String message;

  const PharmaciesError(this.message); // Mark as const

  @override
  List<Object?> get props => [message];
}
