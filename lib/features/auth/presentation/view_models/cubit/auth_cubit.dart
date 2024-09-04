import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repo/auth_repo_abstract.dart';

part 'auth_state.dart';

enum Gender { male, female }
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  UserModel? currentUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  String countryCode = ''; // Default country code
  String phoneNumber = '';
  AuthCubit(this.authRepository) : super(AuthInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

  Future<void> signIn(String email, String password) async {
    emit(SignInLoadingState());
    try {
      final userCredential = await authRepository.signIn(email, password);
      final user = await authRepository.getUserInfo(userCredential.id);
      emit(SignInSuccessState(user: user));
    } on FirebaseAuthException catch (e) {
      _sigInHandelException(e);
    } catch (e) {
      emit(SignInFailureState(errMessage: e.toString()));
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String birthDate,
  }) async {
    emit(SignUpLoadingState());
    try {
      final userCredential = await authRepository.signUp(email, password);
      final uid = userCredential.user!.uid;

      final newUser = UserModel(
        id: uid,
        name: name,
        email: email,
        phoneNumber: phone,
        birthDate: birthDate,
        gender: selectedGender == Gender.male ? 'male' : 'female', // Set gender
      );
      await authRepository.addUser(newUser);

      emit(SignUpSuccessState(user: newUser));
    } on FirebaseAuthException catch (e) {
      _sigUpHandelException(e);
    } catch (e) {
      emit(SignUpFailureState(errMessage: e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      await authRepository.signOut();
      emit(SignOutSuccessState()); // Emit a state indicating that the user has signed out.
    } catch (e) {
      emit(SignOutErrorState(e.toString())); // Emit an error state if sign out fails.
    }
  }

  Future<void> updateUserInfo(
      String name,
      String phone,
      String birthDate,
      ) async {
    if (currentUser == null) {
      emit(UserInfoUpdateFailureState(errMessage: "User not signed in"));
      return;
    }
    try {
      final updatedUser = UserModel(
        id: currentUser!.id,
        name: name,
        email: currentUser!.email,
        phoneNumber: phone,
        birthDate: birthDate,
        gender: '',
      );
      await authRepository.updateUserInfo(updatedUser);
      currentUser = updatedUser;
      emit(UserInfoUpdateSuccessState(user: updatedUser));
    } catch (e) {
      emit(UserInfoUpdateFailureState(errMessage: e.toString()));
    }
  }

  void _sigUpHandelException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(
          SignUpFailureState(errMessage: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(SignUpFailureState(
          errMessage: 'The account already exists for that email'));
    } else if (e.code == 'invalid-email') {
      emit(SignUpFailureState(errMessage: 'The email is invalid'));
    } else {
      emit(SignUpFailureState(errMessage: e.code));
    }
  }

  void _sigInHandelException(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      emit(SignInFailureState(errMessage: "No user found for that email"));
    } else if (e.code == 'wrong-password') {
      emit(SignInFailureState(
          errMessage: 'Wrong password provided for that user'));
    } else {
      emit(SignInFailureState(errMessage: "Check your email and password"));
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    emit(PasswordResetEmailLoadingState());
    try {
      await authRepository.sendPasswordResetEmail(email);
      emit(PasswordResetEmailSuccessState());
    } catch (e) {
      emit(PasswordResetEmailFailureState(errMessage: e.toString()));
    }
  }

  Future<void> confirmPasswordReset(String otp, String newPassword) async {
    emit(PasswordResetConfirmLoadingState());
    try {
      await authRepository.confirmPasswordReset(otp, newPassword);
      emit(PasswordResetConfirmSuccessState());
    } catch (e) {
      emit(PasswordResetConfirmFailureState(errMessage: e.toString()));
    }
  }

  Future<void> sendOtp(String phoneNumber) async {
    emit(OTPLoadingState());
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-retrieve or instant verification.
          await auth.signInWithCredential(credential);
          emit(OTPVerifiedState());
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(OTPFailedState(e.message ?? 'Verification failed'));
        },
        codeSent: (String verificationId, int? resendToken) {
          // Store the verification ID and resend token so you can use them later
          emit(OTPSentState(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle timeout
          emit(OTPTimeoutState(verificationId));
        },
      );
    } catch (e) {
      emit(OTPFailedState(e.toString()));
    }
  }

  Future<void> verifyOtp(String verificationId, String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        // Emit OTP verified state
        emit(OTPVerifiedState());
        print('Verify Success');

      } else {
        emit(OTPFailedState('Verification failed: No user'));
      }
    } on FirebaseAuthException catch (e) {
      emit(OTPFailedState(e.message ?? 'Verification failed'));
    } catch (e) {
      emit(OTPFailedState('Verification failed: ${e.toString()}'));
    }
  }

  Future<void> resetPassword(String newPassword) async {
    try {
      await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
      // Notify user of success (e.g., show a message or navigate to another screen)
    } catch (e) {
      // Handle error
      print('Password reset failed: ${e.toString()}');
    }
  }
}
