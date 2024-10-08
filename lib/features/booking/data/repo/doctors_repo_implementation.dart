import 'package:dartz/dartz.dart';
import 'package:doctory/core/dataSource/api/api_consumer.dart';
import 'package:doctory/core/dataSource/local/cache.dart';
import 'package:doctory/core/error/error_model.dart';
import 'package:doctory/core/error/exceptions.dart';
import 'package:doctory/features/booking/data/models/doctor_model.dart';
import 'package:doctory/features/booking/data/repo/doctors_repo.dart';

class DoctorsRepoImplementation implements DoctorsRepo {
  final ApiConsumer apiConsumer;

  DoctorsRepoImplementation({required this.apiConsumer});
final token = CacheHelpers.getToken();
  @override
  Future<Either<ErrorModel, List<DoctorModel>>> getDoctors() async {
    try {
     
        final response = await apiConsumer.get("/doctors", headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
          'Authorization': "Bearer $token"
        });
        final doctors = (response as List)
            .map((json) => DoctorModel.fromJson(json))
            .toList();

        return Right(doctors);
      
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<DoctorModel>>> getDoctorsByCity(
      {required String city}) async {
    try {
      final response = await apiConsumer.post(
        "/doctorsByCity",
        data: {
          'name': city,
        },
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
          'Authorization':  "Bearer $token"
        },
        isFormData: true,
      );
      final doctors =
          (response as List).map((json) => DoctorModel.fromJson(json)).toList();
      return Right(doctors);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<DoctorModel>>> getDoctorsBySpecialization(
      {required String specializationName}) async {
    try {
      final response = await apiConsumer.post(
        "/doctorsBySpecialization",
        data: {
          'name': specializationName,
        },
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
          'Authorization':  "Bearer $token"
        },
        isFormData: true,
      );
      final doctors =
          (response as List).map((json) => DoctorModel.fromJson(json)).toList();
      return Right(doctors);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<DoctorModel>>> filtteredDoctors({
    required String specializationName,
    required String city,
  }) async {
    try {
      final response = await apiConsumer.post(
        "AllInOne",
        data: {
          "specialization_name": specializationName,
          "city_name": city,
        },
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
          'Authorization':  "Bearer $token"
        },
        isFormData: true,
      );
      final doctorsList = (response['doctors'] as List)
        .map((json) => DoctorModel.fromJson(json))
        .toList();
      return Right(doctorsList);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
