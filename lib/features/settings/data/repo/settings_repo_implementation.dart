import 'package:dartz/dartz.dart';
import 'package:doctory/core/dataSource/api/api_consumer.dart';
import 'package:doctory/core/dataSource/local/cache.dart';
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
}