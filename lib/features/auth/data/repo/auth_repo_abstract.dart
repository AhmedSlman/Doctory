import 'package:dartz/dartz.dart';
import '../models/user_model.dart';
import '../models/verify_model.dart';

abstract class AuthRepository {
  Future<Either<String, UserModel>> signUp({
    required final String name,
    required final String phone,
    required final String birthdate,
    required final String email,
    required final String password,
    required final String confirmPassword,
  });
  Future<Either<String, UserModel>> signIn(
    String email,
    String password,
  );
  Future<Either<String, VerificationResponse>> verifyEmail(
      String email, String otp);
}
