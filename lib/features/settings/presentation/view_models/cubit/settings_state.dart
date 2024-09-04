part of 'settings_cubit.dart';

@immutable
abstract class SettingsState extends Equatable {
  @override
  List<Object> get props => [];
}
final class SettingsInitial extends SettingsState {}

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