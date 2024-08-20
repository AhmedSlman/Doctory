import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class IconTextWidget extends StatelessWidget {
  final String iconPath;
  final String primaryText;
  final String? finalText;
  final TextStyle? primaryTextStyle;
  final TextStyle? finalTextStyle;

  const IconTextWidget({
    super.key,
    required this.iconPath,
    required this.primaryText,
    this.finalText,
    this.primaryTextStyle,
    this.finalTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 18.w,
          height: 18.h,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          primaryText,
          style: primaryTextStyle ?? AppStyles.sBlack12.copyWith(color: AppColors.primaryColor),
        ),
        SizedBox(
          width: 5.w,
        ),
        if (finalText != null)
          Text(
            finalText!,
            style: finalTextStyle ?? AppStyles.sBlack12.copyWith(color: AppColors.greyForIcon),
          ),
      ],
    );
  }
}
