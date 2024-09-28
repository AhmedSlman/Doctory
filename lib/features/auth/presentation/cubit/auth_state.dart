import 'package:doctory/features/auth/data/models/user_model.dart';
import 'package:doctory/features/auth/presentation/cubit/auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

// Register states
class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final UserModel userModel;
  RegisterSuccessState({required this.userModel});
}

class RegisterFailureState extends AuthState {
  final String errMessage;
  RegisterFailureState({required this.errMessage});
}

// Sign-in states
class SignInLoadingState extends AuthState {}

class SignInSuccessState extends AuthState {}

class SignInFailureState extends AuthState {
  final String errMessage;
  SignInFailureState({required this.errMessage});
}

// Email verification states
class VerifyEmailLoadingState extends AuthState {}

class VerifyEmailSuccessState extends AuthState {
  final dynamic verificationResponse;
  VerifyEmailSuccessState({required this.verificationResponse});
}

class VerifyEmailFailureState extends AuthState {
  final String errMessage;
  VerifyEmailFailureState({required this.errMessage});
}

// Toggle password visibility state
class TogglePasswordState extends AuthState {
  final bool isSecured;
  TogglePasswordState(this.isSecured);
}

// Gender selection state
class AuthGenderChangedState extends AuthState {
  final Gender gender;
  AuthGenderChangedState(this.gender);
}

final class ObscurePasswordTextUpdateState extends AuthState {}
