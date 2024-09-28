import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:doctory/features/auth/presentation/cubit/auth_state.dart';
import '../../data/repo/auth_repo_abstract.dart';
import '../../../../core/utils/app_colors.dart';

enum Gender { male, female }

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey();
  final GlobalKey<FormState> signInFormKey = GlobalKey();
  bool obscurePasswordTextValue = true;

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

  Gender selectedGender = Gender.male;
  void changeGender(Gender gender) {
    selectedGender = gender;
    emit(AuthGenderChangedState(selectedGender));
  }

  Future<void> signUp({
    required String email,
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required bool isMale,
    required DateTime birthdate,
  }) async {
    emit(RegisterLoadingState());

    final result = await authRepo.signUp(
      email: email,
      name: name,
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
      isMale: isMale,
      birthdate: birthdate,
    );

    result.fold(
      (error) => emit(RegisterFailureState(errMessage: error)),
      (user) => emit(RegisterSuccessState(userModel: user)),
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    final response = await authRepo.signIn(email, password);
    response.fold(
      (error) => emit(SignInFailureState(errMessage: error)),
      (user) => emit(SignInSuccessState()),
    );
  }

  Future<void> verifyEmail({
    required String email,
    required String otp,
  }) async {
    emit(VerifyEmailLoadingState());
    final response = await authRepo.verifyEmail(email, otp);
    response.fold(
      (error) => emit(VerifyEmailFailureState(errMessage: error)),
      (result) => emit(VerifyEmailSuccessState(verificationResponse: result)),
    );
  }
}
