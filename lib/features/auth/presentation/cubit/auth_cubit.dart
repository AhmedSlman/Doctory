import 'package:bloc/bloc.dart';
import 'package:doctory/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/repo/auth_repo_abstract.dart';

enum Gender { male, female }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepository authRepo;
//
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
//
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> signInFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

  //
  bool isSecured = true;

  Widget togglePass() {
    return IconButton(
      onPressed: () {
        isSecured = !isSecured;
        emit(TogglePasswordState(isSecured));
      },
      icon: isSecured
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: AppColors.greyForIcon,
    );
  }

  Gender selectedGender = Gender.male;

  void changeGender(Gender gender) {
    selectedGender = gender;
    emit(AuthGenderChangedState(selectedGender));
  }

  bool termsAndCondtionCheckBoxValue = false;
  bool? obscurePasswordTextValue = true;
  late SharedPreferences pref;

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
      (error) {
        emit(RegisterFailureState(errMessage: error));
      },
      (user) {
        emit(RegisterSuccessState(userModel: user));
      },
    );
  }

  Future<void> sigInUser({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    final response = await authRepo.signIn(
      email,
      password,
    );
    response.fold(
        (errMessage) => emit(SignInFailureState(errMessage: errMessage)),
        (signInModel) => emit(SignInSuccessState()));
  }
}
