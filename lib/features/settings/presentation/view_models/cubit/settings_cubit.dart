import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../auth/data/models/user_model.dart';
import '../../../data/models/report_problem_model.dart';
import '../../../data/repo/settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo settingsRepo;
  UserModel? currentUser;
  SettingsCubit(this.settingsRepo) : super(SettingsInitial());

  Future<void> getUserData(String userId) async {
    try {
      emit(GetUserDataLoading());
      final user = await settingsRepo.getUserData(userId);
      currentUser = user;
      emit(GetUserDataSuccess(user));
    } catch (e) {
      emit(GetUserDataError('Failed to load user data'));
    }
  }


  Future<void> saveUserData(UserModel user) async {
    try {
      emit(SaveUserDataLoading());
      await settingsRepo.updateUserData(user);
      emit(SaveUserDataSuccess(user));
    } catch (e) {
      emit(SaveUserDataError('Failed to save user data'));
    }
  }


  Future<void> submitReport(ReportProblemModel reportProblem) async {
    try {
      emit(ReportProblemSubmitting());
      await settingsRepo.submitReport(reportProblem);
      emit(ReportProblemSubmitted());
    } catch (e) {
      emit(ReportProblemSubmitError('Failed to submit report'));
    }
  }
}



