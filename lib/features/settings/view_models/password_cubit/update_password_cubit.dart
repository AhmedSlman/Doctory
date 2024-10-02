import 'package:doctory/features/settings/data/repo/settings_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/password_model.dart';
import 'update_password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  final SettingsRepo repository;

  PasswordCubit(this.repository) : super(PasswordInitial());

  Future<void> changePassword(PasswordModel password) async {
    emit(PasswordLoading());
    final result = await repository.changePassword(password);
    result.fold(
      (error) => emit(PasswordFailure(error)),
      (response) => emit(PasswordSuccess(response)),
    );
  }
}