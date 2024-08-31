import 'package:doctory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AuthTextFormFieldWidget extends StatelessWidget {
  const AuthTextFormFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.onTap,


  });
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onTap; // Add this field



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onTap: onTap,
      readOnly: onTap != null,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon:suffixIcon ,
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        filled: true,
        fillColor: AppColors.whiteColor,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.whiteColor),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.blueForText),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
