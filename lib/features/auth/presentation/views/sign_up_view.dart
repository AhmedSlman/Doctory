import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_assets.dart';
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/core/widgets/custom_button.dart';
import 'package:doctory/features/auth/presentation/view_models/cubit/auth_cubit.dart';
import 'package:doctory/features/auth/presentation/widgets/auth_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../../generated/l10n.dart';
import '../view_models/cubit/auth_state.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {

    var cubit=BlocProvider.of<AuthCubit>(context);
    final isLTR = Localizations.localeOf(context).languageCode == 'en';
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          showToast(msg:"يرجي تـاكيد الايميـل",
          color: Colors.green,
          );
          GoRouter.of(context).push(
            RouterNames.bottomNavBar,
          );
        } else if (state is SignInFailureState) {
          showToast(
              msg:state.errMessage,
              color: AppColors.redColor

          );
        }
  },
  builder: (context, state) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.whiteColor,
              AppColors.scaffoldColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Spacer for top padding
              Image.asset(AppAssets.logo),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Align(
                alignment: isLTR ? Alignment.centerLeft : Alignment.centerRight,
                child: Text(
                  S.of(context).createAccount,
                  style: AppStyles.s18.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              AuthTextFormFieldWidget(
                hintText: S.of(context).fullName,
                controller: cubit.nameController,

              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              AuthTextFormFieldWidget(
                hintText: S.of(context).phone,
                controller:cubit.phoneController ,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              AuthTextFormFieldWidget(
                hintText: S.of(context).email,
                controller:cubit.emailAddressController ,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              AuthTextFormFieldWidget(
                hintText: S.of(context).dateOfBirth,
                controller:cubit.birthDateController ,
                onTap: () async{
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(1990),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now()
                  );
                  if (pickedDate != null) {
                    String formattedDate = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                    cubit.birthDateController.text = formattedDate;
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              AuthTextFormFieldWidget(
                hintText: S.of(context).password,
                controller: cubit.passwordController,
                obscureText: context.read<AuthCubit>().isSecured,
                suffixIcon: context.read<AuthCubit>().togglePass(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                children: [
                  Radio<Gender>(
                    value: Gender.male,
                    groupValue: cubit.selectedGender,
                    onChanged: (Gender? value) {
                      if (value != null) {
                        cubit.selectGender(value);
                      }
                    },
                  ),
                  Text(S.of(context).male),
                  Radio<Gender>(
                    value: Gender.female,
                    groupValue: cubit.selectedGender,
                    onChanged: (Gender? value) {
                      if (value != null) {
                        cubit.selectGender(value);
                      }
                    },
                  ),
                  Text(S.of(context).female),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              state is SignInLoadingState
              ? const CustomCircularProgressIndicator()
              :CustomButton(
                text: S.of(context).createAccount,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.07,
                onPressed: () {
                  cubit.registerUser(
                    email: cubit.emailAddressController!.text,
                    password: cubit.passwordController!.text,
                    name: cubit.nameController.text,
                  //  phone: cubit.phoneController.text,
                  //  birthDate: cubit.birthDateController.text,
                  );
                 // print(cubit.signUp.toString());

                },
              ),
              TextButton(
                child: Text(
                  S.of(context).login,
                  style: AppStyles.s16,
                ),
                onPressed: () {
                  context.go(RouterNames.login);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Spacer for bottom padding
            ],
          ),
        ),
      );
  },
),
    );
  }
}
