// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
//
// import '../../../../core/routes/router_names.dart';
// import '../../../../core/utils/app_assets.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/app_styles.dart';
// import '../../../../core/widgets/custom_button.dart';
// import '../../../../generated/l10n.dart';
// import '../view_models/cubit/auth_cubit.dart';
// import '../widgets/forget_password_app_bar.dart';
//
// class EnterYourPhoneView extends StatelessWidget {
//   const EnterYourPhoneView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = BlocProvider.of<AuthCubit>(context);
//
//     return Scaffold(
//       body: BlocConsumer<AuthCubit, AuthState>(
//         listener: (context, state) {
//           if (state is OTPSentState) {
//             context.go(RouterNames.forgetPassword);
//           } else if (state is OTPFailedState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.error)),
//             );
//           }
//         },
//         builder: (context, state) {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 28),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 100.h),
//                   const ForgetPasswordAppBar1(),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.07),
//                   InternationalPhoneNumberInput(
//                     onInputChanged: (PhoneNumber number) {
//                       cubit.phoneNumber = number.phoneNumber ?? '';
//                     },
//                     onInputValidated: (bool value) {},
//                     selectorConfig: const SelectorConfig(
//                       selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//                     ),
//                     ignoreBlank: false,
//                     autoFocus: false,
//                     formatInput: false,
//                     keyboardType: TextInputType.phone,
//                     inputDecoration: InputDecoration(
//                       hintText: S.of(context).phone,
//                       contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                       filled: true,
//                       fillColor: AppColors.whiteColor,
//                       border: OutlineInputBorder(
//                         borderSide: const BorderSide(color: AppColors.whiteColor),
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: AppColors.blueForText),
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: AppColors.primaryColor),
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.05),
//                   Image.asset(AppAssets.resetCodeImage),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.07),
//                   CustomButton(
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     height: MediaQuery.of(context).size.height * 0.07,
//                     text: S.of(context).send,
//                     onPressed: () {
//                       cubit.sendOtp(cubit.phoneNumber);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ForgetPasswordAppBar1 extends StatelessWidget {
//   const ForgetPasswordAppBar1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(
//           onPressed: () {
//             context.go(RouterNames.login);
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               S.of(context).forgotPassword,
//               style: AppStyles.s18.copyWith(color: AppColors.blackForText),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10.0),
//               child: RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   text: S.of(context).enterYourPhone,
//                   style: DefaultTextStyle.of(context).style,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
