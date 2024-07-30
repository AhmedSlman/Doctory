import 'package:doctory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AuthTextFormFieldWidget extends StatelessWidget {
  const AuthTextFormFieldWidget({
    super.key,
    required this.hintText,
  });
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
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
