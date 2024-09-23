import 'package:dartz/dartz.dart';
import '../models/user_model.dart';
import '../models/verify_model.dart';

abstract class AuthRepository {
  Future<Either<String , UserModel>> signUp(String email, String password);
  Future<Either<String , UserModel>> signIn(String email, String password);


  Future<Either<String , VerificationResponse>> verifyEmail(String email, String otp);




}