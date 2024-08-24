import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';


class ReportTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onEditingCompleted;
  final ValueChanged<String>? onFieldSubmitted;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? contentPadding; // Add contentPadding parameter

  const ReportTextField({
    super.key,
    this.controller,
    this.validator,
    this.obsecure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.onEditingCompleted,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.onTap,
    this.textStyle,
    this.maxLines,
    this.minLines,
    this.contentPadding, // Initialize contentPadding
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle = AppStyles.sSubTitleGrey.copyWith(
      fontSize: 16,
      color: Colors.black,
    );

    return TextFormField(
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obsecure,
      onChanged: onChanged,
      onEditingComplete: onEditingCompleted,
      cursorColor: Colors.black,
      readOnly: readOnly,
      style: textStyle ?? defaultTextStyle,
      maxLines: maxLines ?? 5,
      minLines: minLines ?? 3,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: AppStyles.sSubTitleGrey,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
