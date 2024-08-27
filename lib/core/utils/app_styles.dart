import 'package:doctory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle s18 = TextStyle(
    fontSize: 24.sp,
    fontFamily: "Cairo",
    fontWeight: FontWeight.w600,
    color: AppColors.blueForText,
  );
  static TextStyle s17 = TextStyle(
    fontSize: 17.sp,
    fontFamily: "Cairo",
    fontWeight: FontWeight.w600,
    color: AppColors.blackForText,
  );
  static TextStyle s16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: "Cairo",
    fontWeight: FontWeight.w600,
    color: AppColors.blueForText,
  );
  static TextStyle sBlack15 = TextStyle(
    fontSize: 15.sp,
    fontFamily: "Cairo",
    color: AppColors.blackForText,
      overflow: TextOverflow.ellipsis

  );
  static TextStyle sBlack12 = TextStyle(
    fontSize: 12.sp,
    fontFamily: "Cairo",
    color: AppColors.blackForText,
    overflow: TextOverflow.ellipsis,

  );

  static TextStyle sPrimaryColor14 =  TextStyle(
    fontSize: 14.sp,
    fontFamily: "Cairo",
    fontWeight: FontWeight.normal,
    color: AppColors.primaryColor,
  );

  static TextStyle sOldPrice = TextStyle(
    fontSize: 11.sp,
    fontFamily: "Cairo",
    fontWeight: FontWeight.normal,
    color: AppColors.greyForIcon,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.greyForIcon,
    decorationThickness: 2,

  );
  static TextStyle sPrice = TextStyle(
    fontSize: 12.sp,
    fontFamily: "Cairo",
    fontWeight: FontWeight.normal,
    color: AppColors.blackForText,

  );

  static TextStyle s10 = TextStyle(
    fontSize: 10.sp,
    fontFamily: "Cairo",
    fontWeight: FontWeight.normal,
    color: AppColors.greyForIcon,

  );

  static TextStyle sTextButton = TextStyle(
    fontSize: 11.sp,
    fontFamily: "Cairo",
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,

  );

  static TextStyle sTitle = TextStyle(
    fontSize: 20.sp,
    fontFamily: "Cairo",
    fontWeight: FontWeight.w600,
    color: AppColors.blackForText,
  );

  static TextStyle sSubTitleGrey = TextStyle(
    fontSize: 12.sp,
    fontFamily: "Cairo",
    fontWeight: FontWeight.normal,
    color: AppColors.greyForIcon,

  );


}
