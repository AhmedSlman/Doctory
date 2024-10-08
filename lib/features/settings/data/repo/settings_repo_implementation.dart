import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctory/core/dataSource/api/api_consumer.dart';
import 'package:doctory/core/dataSource/local/cache.dart';
import 'package:doctory/features/settings/data/models/password_model.dart';
import 'package:doctory/features/settings/data/models/profile_model.dart';
import 'package:doctory/features/settings/data/models/report_problem_model.dart';
import 'package:doctory/features/settings/data/models/reserve_model.dart';
import 'package:doctory/features/settings/data/repo/settings_repo.dart';

class SettingsRepoImplementation implements SettingsRepo {
  final ApiConsumer apiConsumer;

  SettingsRepoImplementation({required this.apiConsumer});

  @override
  Future<Either<String, Profile>> getUserData() async {
    try {
      final token = CacheHelpers.getToken();

      var data = await apiConsumer.get('/profile', headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': "Bearer $token"
      });
      if (data != null && data['profile'] != null) {
        Profile profile = Profile.fromJson(data['profile']);
        return Right(profile);
      } else {
        return Left('Error: Invalid data received');
      }
    } catch (e) {
      return Left('Error when fetching data: $e');
    }
  }

  @override
  Future<Profile> updateUserData(Profile user) {
    try {
      final token = CacheHelpers.getToken();

      return apiConsumer.post('/update-profile', data: {
        'name': user.name,
        'phone': user.phone,
        'email': user.email,
        'birthdate': user.birthdate.toIso8601String(),
      }, headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': "Bearer $token"
      }).then((data) {
        return Profile.fromJson(data['profile']);
      });
    } catch (e) {
      throw Exception('Error when updating user data: $e');
    }
  }

  @override
  Future<Either<String, dynamic>> changePassword(PasswordModel password) async {
    try {
      final token = CacheHelpers.getToken();

      final response = await apiConsumer.post('/change-password', data: {
        "current_password": password.oldPassword,
        "new_password": password.newPassword,
        "new_password_confirmation": password.confirmPassword,
      }, headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': "Bearer $token"
      });
      if (response.containsKey('message')) {
        return right(response['message']);
      } else {
        return left('Unexpected response format');
      }
    } catch (error) {
      return left("Failed to change password: $error");
    }
  }


Future<Either<String, ProblemResponse>> reportProblemModel(
    String text, File image) async {
  try {
    final token = CacheHelpers.getToken(); // الحصول على الـ token

    FormData formData = FormData.fromMap({
      'description': text,
      'image': await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
    });

    final response = await apiConsumer.post(
      '/problem',
      data: formData,
      
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'multipart/form-data', // إعداد Content-Type المناسب
          'Authorization': "Bearer $token",
        },
      
    );

     if (response.statusCode == 200 || response.statusCode == 201) {
      return right(ProblemResponse.fromJson(response.data));
    } else { 
        
     if ( response.containsKey('message')) {
        return left(response.data['message']);
      } else {
        return left('Unknown error occurred');
      }
    
    }
  } on DioException catch (error) {
    if (error.response?.statusCode == 422) {
      return left('Invalid data: ${error.response?.data}');
    } else {
      return left('Request failed: ${error.message}');
    }
  } catch (error) {
    return left('An unexpected error occurred: $error');
  }
}

  @override
  Future<Either<String, List<Appointment>>> getReserve()async {
    try {
      final token = CacheHelpers.getToken();

      var data = await apiConsumer.get('/reservations', headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': "Bearer $token"
      });
          if (data != null && data is List) {
        List<Appointment> appointments = data
            .map((appointmentJson) => Appointment.fromJson(appointmentJson))
            .toList();

        return Right(appointments);
      } else {
        return const Left('Error: Invalid data received');
      }
    } catch (e) {
      return Left('Error when fetching data: $e');
    }
  }

}
