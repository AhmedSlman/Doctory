import 'package:dartz/dartz.dart';
import 'package:doctory/features/auth/data/models/login_response.dart';
import '../models/user_model.dart';
import '../models/verify_model.dart';

abstract class AuthRepository {
  Future<Either<String, UserModel>> signUp({
    required String email,
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required bool isMale,
    required DateTime birthdate,
  });
  Future<Either<String, LoginResponse>> signIn(
    String email,
    String password,
  );
  Future<Either<String, VerificationResponse>> verifyEmail(
    String email,
    String otp,
  );
}
