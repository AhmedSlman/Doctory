import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonColor,
    required this.text,
    required this.onPressed,
    this.width,
    required this.height,
    this.textColor,
  });

  final Color? buttonColor;
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color:AppColors.primaryColor,
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppStyles.s18.copyWith(
              color: textColor ?? AppColors.whiteColor,
              fontSize: 13,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
