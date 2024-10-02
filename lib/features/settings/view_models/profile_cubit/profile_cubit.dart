import 'package:dartz/dartz.dart';
import 'package:doctory/features/settings/data/models/profile_model.dart';
import 'package:doctory/features/settings/data/repo/settings_repo.dart';
import 'package:doctory/features/settings/view_models/profile_cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final SettingsRepo settingsRepo;

  ProfileCubit({required this.settingsRepo}) : super(GetUserDataInitial());

  Future<void> getUserData() async {
    try {
      emit(GetUserDataLoading()); 

      final Either<String, Profile> result = await settingsRepo.getUserData();

      result.fold(
        (errorMsg) => emit(GetUserDataError(errorMsg)),
        (profile) => emit(GetUserDataSuccess(profile)), 
      );
    } catch (e) {
      emit(GetUserDataError('An unexpected error occurred: $e'));
    }
  }
Future<void> updateUser(Profile profile, ) async {
    try {
      emit(UserUpdatedLoading());
      final updatedProfile = await settingsRepo.updateUserData(profile);
      emit(UserUpdatedSuccess(updatedProfile));
    } catch (e) {
      emit(UserUpdatedError('Error updating profile: $e'));
    }
  }
    
}