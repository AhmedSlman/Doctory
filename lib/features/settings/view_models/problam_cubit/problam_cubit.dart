import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:doctory/features/settings/data/models/report_problem_model.dart';
import 'package:doctory/features/settings/data/repo/settings_repo.dart';
import 'package:doctory/features/settings/view_models/problam_cubit/problam_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
class ReportProblemCubit extends Cubit<ReportProblemState> {
  final SettingsRepo repository;

  ReportProblemCubit(this.repository) : super(ReportProblemInitial());

  File? file;
  TextEditingController problemText = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> reportProblem() async {
    if (formKey.currentState?.validate() != true || file == null) {
      emit(ReportProblemFailure("Please provide a description and select an image."));
      return;
    }

    emit(ReportProblemLoading());

    final Either<String, ProblemResponse> response = 
      await repository.reportProblemModel(problemText.text, file!);

    response.fold(
      (failure) => emit(ReportProblemFailure(failure)),
      (success) {
        clearFields(); 
        emit(ReportProblemSuccess(success));
      },
    );
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

  // مسح الصورة والبيانات
  void clearImage() {
    file = null;
    emit(ReportProblemInitial());
  }

  // تفريغ الحقول بعد نجاح الإرسال
  void clearFields() {
    file = null;
    problemText.clear();
    emit(ReportProblemInitial());
  }
}