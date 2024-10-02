import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctory/core/dataSource/api/api_consumer.dart';
import 'package:doctory/core/dataSource/local/cache.dart';
import 'package:doctory/features/settings/data/models/password_model.dart';
import 'package:doctory/features/settings/data/models/profile_model.dart';
import 'package:doctory/features/settings/data/repo/settings_repo.dart';
class SettingsRepoImplementation implements SettingsRepo {
      final ApiConsumer apiConsumer;

  SettingsRepoImplementation({required this.apiConsumer});

  

  @override
   Future<Either<String,Profile>> getUserData() async{
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

    return  apiConsumer.post('/update-profile', data: {
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

      final response = await apiConsumer.post(
        '/change-password',
        data: {
          "current_password":password.oldPassword,
          "new_password": password.newPassword,
          "new_password_confirmation": password.confirmPassword,
        },
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
           'Authorization': "Bearer $token" 
        }
      );
   if (response.containsKey('message')) {
      return right(response['message']);
    } else {
      return left('Unexpected response format');
    }
  } catch (error) {
    return left("Failed to change password: $error");
  }
  }
}