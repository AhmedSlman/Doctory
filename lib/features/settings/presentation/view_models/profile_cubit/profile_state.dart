
import 'package:doctory/features/settings/data/models/profile_model.dart';
 abstract class ProfileState {}

class GetUserDataInitial extends ProfileState{}

 class GetUserDataLoading extends ProfileState {}

 class GetUserDataSuccess extends ProfileState {
  final Profile profile;

  GetUserDataSuccess(this.profile);
}

 class GetUserDataError extends ProfileState {
  final String errorMsg;
  GetUserDataError(this.errorMsg);
}


class UserUpdatedInitial extends ProfileState{}

 class UserUpdatedLoading extends ProfileState {}

 class UserUpdatedSuccess extends ProfileState {
  final Profile profile;

 UserUpdatedSuccess(this.profile);
}

 class UserUpdatedError extends ProfileState {
  final String errorMsg;
  UserUpdatedError(this.errorMsg);
}
