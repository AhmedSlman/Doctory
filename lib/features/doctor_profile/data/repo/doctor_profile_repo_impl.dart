

import 'package:dartz/dartz.dart';
import 'package:doctory/core/dataSource/api/api_consumer.dart';
import 'package:doctory/core/dataSource/local/cache.dart';
import 'package:doctory/core/error/error_model.dart';
import 'package:doctory/core/error/exceptions.dart';
import 'package:doctory/features/doctor_profile/data/model/doctor_profile_model.dart';
import 'package:doctory/features/doctor_profile/data/repo/doctor_profile_repo.dart';

class DoctorProfileRepoImpl extends DoctorProfileRepo {
    final ApiConsumer apiConsumer;

  DoctorProfileRepoImpl({required this.apiConsumer});

  @override
  Future<Either<ErrorModel, DoctorProfileModel>> getDoctors({int? doctorId})  async {
    try {
     
        final response = await apiConsumer.get("/doctors/$doctorId", headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
          'Authorization': "Bearer ${CacheHelpers.getToken()}"
        });
        final doctor = DoctorProfileModel.fromJson(response);
        return Right(doctor);
     
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}