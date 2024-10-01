import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../auth/data/models/user_model.dart';
import '../../../../home/data/models/booking_model.dart';
import '../../../../home/data/models/offer_model.dart';
import '../../../data/models/report_problem_model.dart';
import '../../../data/repo/settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo settingsRepo;
  UserModel? currentUser;

  //final ImagePicker _imagePicker = ImagePicker();
  File? file;
  TextEditingController problemText = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ReportProblemModel? reportProblemModel;

  SettingsCubit(this.settingsRepo) : super(SettingsInitial());

  Future<void> getUserData(String userId) async {
    try {
      emit(GetUserDataLoading());
      // final user = await settingsRepo.getUserData(userId);
      // currentUser = user;
      // emit(GetUserDataSuccess(user));
    } catch (e) {
      emit(GetUserDataError('Failed to load user data'));
    }
  }

  Future<void> saveUserData(UserModel user) async {
    try {
      emit(SaveUserDataLoading());
    //  await settingsRepo.updateUserData(user);
      emit(SaveUserDataSuccess(user));
    } catch (e) {
      emit(SaveUserDataError('Failed to save user data'));
    }
  }

  void selectGender(String gender) {
    emit(GenderSelectionState(gender));
  }

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        file = File(image.path);
        emit(ReportImagePickedSuccess(image.path));
      } else {
        emit(ReportImagePickError("No image selected"));
      }
    } catch (e) {
      emit(ReportImagePickError(e.toString()));
    }
  }

  void clearImage() {
    file = null;
    emit(SettingsInitial());
  }

  Future<void> submitReport(ReportProblemModel reportProblem) async {
    try {
      emit(ReportProblemSubmitting());
    //  await settingsRepo.submitReport(reportProblem);
      emit(ReportProblemSubmitted());
    } catch (e) {
      emit(ReportProblemSubmitError('Failed to submit report'));
    }
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (newPassword != confirmPassword) {
      emit(ChangePasswordError('Passwords do not match'));
      return;
    }

    try {
      emit(ChangePasswordLoading());
      //await settingsRepo.updatePassword(oldPassword, newPassword);
      emit(ChangePasswordSuccess());
    } catch (e) {
      emit(ChangePasswordError(e.toString()));
    }
  }

  Future<void> getBookedOffers(String userId) async {
    try {
      emit(GetBookedOffersLoading());

      //final bookedOffers = await settingsRepo.getBookedOffers(userId);

      //emit(GetBookedOffersSuccess(bookedOffers));
    } catch (e) {
      emit(GetBookedOffersError('Failed to load booked offers'));
    }
  }
}
