import 'package:doctory/features/auth/presentation/cubit/auth_cubit.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {
  final String message;

  RegisterSuccessState({required this.message});
}

final class RegisterFailureState extends AuthState {
  final String errMessage;

  RegisterFailureState({required this.errMessage});
}

final class SignInLoadingState extends AuthState {}

final class SignInSuccessState extends AuthState {}

final class SignInFailureState extends AuthState {
  final String errMessage;

  SignInFailureState({required this.errMessage});
}

final class UserLoggedInState extends AuthState {
  final bool isLoggedIn;

  UserLoggedInState({required this.isLoggedIn});
}

//Password obscure
class TogglePasswordState extends AuthState {
  final bool isSecured;
  TogglePasswordState(this.isSecured);
}

//Gender State
final class GenderSelectionChanged extends AuthState {}

// otp
final class OTPFailedState extends AuthState {
  final String error;

  OTPFailedState(this.error);
}

class OTPLoadingState extends AuthState {}

class OTPSentState extends AuthState {
  final String verificationId;
  OTPSentState(this.verificationId);
}

class OTPVerifiedState extends AuthState {}

class OTPTimeoutState extends AuthState {
  final String verificationId;
  OTPTimeoutState(this.verificationId);
}

class AuthGenderChangedState extends AuthState {
  final Gender selectedGender;

  AuthGenderChangedState(this.selectedGender);
}
