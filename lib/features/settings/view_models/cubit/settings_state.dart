part of 'settings_cubit.dart';

@immutable
abstract class SettingsState extends Equatable {
  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

class GenderSelectionState extends SettingsState {
  final String selectedGender;

  GenderSelectionState(this.selectedGender);

  @override
  List<Object> get props => [selectedGender];
}

//Get User Data
final class GetUserDataLoading extends SettingsState {}

final class GetUserDataSuccess extends SettingsState {
  final UserModel userModel;

  GetUserDataSuccess(this.userModel);
}

final class GetUserDataError extends SettingsState {
  final String errorMsg;
  GetUserDataError(this.errorMsg);
}

//Save User Data

final class SaveUserDataLoading extends SettingsState {}

final class SaveUserDataSuccess extends SettingsState {
  final UserModel userModel;

  SaveUserDataSuccess(this.userModel);
}

final class SaveUserDataError extends SettingsState {
  final String errorMsg;
  SaveUserDataError(this.errorMsg);
}

//Report Problem

class ReportProblemSubmitting extends SettingsState {}

class ReportProblemSubmitted extends SettingsState {}

class ReportProblemSubmitError extends SettingsState {
  final String errorMsg;

  ReportProblemSubmitError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

//change password

class ChangePasswordLoading extends SettingsState {}

class ChangePasswordSuccess extends SettingsState {}

class ChangePasswordError extends SettingsState {
  final String message;

  ChangePasswordError(this.message);

  @override
  List<Object> get props => [message];
}

class GetBookedOffersLoading extends SettingsState {}

class GetBookedOffersSuccess extends SettingsState {
  final List<BookingModel> bookedOffers;

  GetBookedOffersSuccess(this.bookedOffers);

  @override
  List<Object> get props => [bookedOffers];
}

class GetBookedOffersError extends SettingsState {
  final String error;

  GetBookedOffersError(this.error);

  @override
  List<Object> get props => [error];
}
