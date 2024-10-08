import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:doctory/features/settings/data/models/password_model.dart';
import 'package:doctory/features/settings/data/models/profile_model.dart';
import 'package:doctory/features/settings/data/models/report_problem_model.dart';
import 'package:doctory/features/settings/data/models/reserve_model.dart';


abstract class SettingsRepo {
  Future<Either<String,Profile>> getUserData();
  Future<Profile> updateUserData(Profile user);
    Future<Either<String, dynamic>> changePassword(PasswordModel password);
    Future<Either<String, ProblemResponse>>reportProblemModel(String text , File image);

    //get reserve
    Future<Either<String, List<Appointment>>> getReserve();

}
