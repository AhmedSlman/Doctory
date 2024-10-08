import 'package:dartz/dartz.dart';
import 'package:doctory/core/error/error_model.dart';
import 'package:doctory/features/doctor_profile/data/model/doctor_profile_model.dart';

abstract class DoctorProfileRepo {


    Future<Either<ErrorModel, DoctorProfileModel>> getDoctors({int? doctorId});

}