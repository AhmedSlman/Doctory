import 'package:dartz/dartz.dart';
import 'package:doctory/core/error/error_model.dart';
import 'package:doctory/features/booking/data/models/doctor_model.dart';

abstract class DoctorsRepo {
  Future<Either<ErrorModel, List<DoctorModel>>> getDoctors();
  Future<Either<ErrorModel, List<DoctorModel>>> getDoctorsBySpecialization({
    required String specializationName,
  });

  Future<Either<ErrorModel, List<DoctorModel>>> getDoctorsByCity({
    required String city,
  });
  Future<Either<ErrorModel, List<DoctorModel>>> filtteredDoctors({
    required String specializationName,
    required String city,
  });
}
