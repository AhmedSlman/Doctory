import 'package:dartz/dartz.dart';
import 'package:doctory/core/dataSource/local/cache.dart';
import 'package:doctory/features/auth/data/models/login_response.dart';
import 'package:doctory/features/auth/data/models/user_model.dart';
import 'package:doctory/features/auth/data/models/verify_model.dart';
import 'package:doctory/features/auth/data/repo/auth_repo_abstract.dart';
import '../../../../core/dataSource/api/api_consumer.dart';
import '../../../../core/error/exceptions.dart';

class AuthRepoImplementation implements AuthRepository {
  final ApiConsumer apiConsumer;

  AuthRepoImplementation({required this.apiConsumer});

  @override
  Future<Either<String, LoginResponse>> signIn(
      String email, String password) async {
    try {
      final response = await apiConsumer.post(
        'login',
        data: {
          'email': email,
          'password': password,
        },
      );
      final data = LoginResponse.fromJson(response.data);
      CacheHelpers.saveToken(value: data.data.token);
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  @override
  Future<Either<String, UserModel>> signUp({
    required String email,
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required bool isMale,
    required DateTime birthdate,
  }) async {
    var data = {
      'email': email,
      'name': name,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'is_male': isMale ? '1' : '0',
      'birthdate': birthdate.toIso8601String().split('T').first,
    };

    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
    };

    try {
      final response = await apiConsumer.post(
        'register',
        data: data,
        headers: headers,
        isFormData: true,
      );

      var user = UserModel.fromJson(response.data['data']['user']);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  @override
  Future<Either<String, VerificationResponse>> verifyEmail(
    String email,
    String otp,
  ) async {
    var data = {
      'email': email,
      'verification_code': otp,
    };
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
    };
    try {
      final response = await apiConsumer.post(
        'verify-email',
        data: data,
        headers: headers,
        isFormData: true,
      );
      return Right(VerificationResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
