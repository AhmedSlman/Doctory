import 'package:bloc/bloc.dart';
import 'package:doctory/features/auth/presentation/view_models/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/repo/auth_repo_abstract.dart';
enum Gender { male, female }
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepository authRepo;
//
  TextEditingController? emailAddressController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
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

  void selectGender(Gender gender) {
    selectedGender = gender;
    emit(GenderSelectionChanged()); // Emit a state to trigger UI update
  }

  bool termsAndCondtionCheckBoxValue = false;
  bool? obscurePasswordTextValue = true;
  late SharedPreferences pref;

  bool? _isUserLoggedIn;
  bool get isUserLoggedIn {
    if (_isUserLoggedIn != null) {
      _isUserLoggedIn = pref.getBool("isUserLoggedIn") ?? false;
    }
    return _isUserLoggedIn!;
  }

  void setUserLoggedIn(bool isLoggedIn) async {
    _isUserLoggedIn = isLoggedIn;
    await pref.setBool('isUserLoggedIn', isLoggedIn);
    emit(UserLoggedInState(isLoggedIn: isLoggedIn));
  }

  Future<void> registerUser(
      {required String name,
      required String email,
      required String password,
      //required String confirmPassword
    }) async {
    emit(RegisterLoadingState());
    final response = await authRepo.signUp(email, password);
    response.fold(
        (errMessage) => emit(RegisterFailureState(errMessage: errMessage)),
        (regesterModel) =>
            emit(RegisterSuccessState(message: regesterModel.message!)));
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



  Future<void> verifyEmail() async {
    emit(OTPLoadingState()); // حالة التحميل

    final result = await authRepo.verifyEmail(emailAddressController!.text, otpController!.text); // استدعاء الميثود من الـ repo

    result.fold(
      (errorMessage) {
        emit(OTPFailedState(errorMessage)); // في حالة الفشل
      },
      (verificationResponse) {
        if (verificationResponse.status == "You have successfully made this request") {
          emit(OTPVerifiedState()); // في حالة النجاح وتحقق الـ OTP
        } else {
          emit(OTPFailedState(verificationResponse.message)); // في حالة حدوث خطأ ما
        }
      },
    );
  }
  
}
