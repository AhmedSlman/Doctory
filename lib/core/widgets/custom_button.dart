import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonColor,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
  });

  final Color? buttonColor;
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

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
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppStyles.s18
                .copyWith(color: AppColors.whiteColor, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
