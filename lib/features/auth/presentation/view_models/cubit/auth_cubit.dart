import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repo/auth_repo_abstract.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  UserModel? currentUser;

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

  Future<void> signIn(String email, String password) async {
    emit(SignInLoadingState());
    try {
      final userCredential = await authRepository.signIn(email, password);
      final user = await authRepository.getUserInfo(userCredential.id);
      ///no changee
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
      );
      await authRepository.addUser(newUser);

      emit(SignUpSuccessState(user: newUser));
    } on FirebaseAuthException catch (e) {
      _sigUpHandelException(e);
    } catch (e) {
      emit(SignUpFailureState(errMessage: e.toString()));
    }
  }

  Future<void>signOut()async {
    await authRepository.signOut();


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
}