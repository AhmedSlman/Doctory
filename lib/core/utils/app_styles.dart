import 'package:doctory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static const s18 = TextStyle(
    fontSize: 24,
    fontFamily: "Cairo",
    fontWeight: FontWeight.w600,
    color: AppColors.blueForText,
  );
  static const s17 = TextStyle(
    fontSize: 17,
    fontFamily: "Cairo",
    fontWeight: FontWeight.w600,
    color: AppColors.blackForText,
  );
  static const s16 = TextStyle(
    fontSize: 16,
    fontFamily: "Cairo",
    fontWeight: FontWeight.w600,
    color: AppColors.blueForText,
  );
  static const sBlack15 = TextStyle(
    fontSize: 15,
    fontFamily: "Cairo",
    color: AppColors.blackForText,
      overflow: TextOverflow.ellipsis

  );
  static const sBlack12 = TextStyle(
    fontSize: 12,
    fontFamily: "Cairo",
    color: AppColors.blackForText,
    overflow: TextOverflow.ellipsis,

  );

  static const sPrimaryColor14 = TextStyle(
    fontSize: 14,
    fontFamily: "Cairo",
    fontWeight: FontWeight.normal,
    color: AppColors.primaryColor,
  );

  static const sOldPrice = TextStyle(
    fontSize: 11,
    fontFamily: "Cairo",
    fontWeight: FontWeight.normal,
    color: AppColors.greyForIcon,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.greyForIcon,
    decorationThickness: 2,

  );
  static const sPrice = TextStyle(
    fontSize: 12,
    fontFamily: "Cairo",
    fontWeight: FontWeight.normal,
    color: AppColors.blackForText,

  );

  static const s10 = TextStyle(
    fontSize: 10,
    fontFamily: "Cairo",
    fontWeight: FontWeight.normal,
    color: AppColors.greyForIcon,

  );

  static const sTextButton = TextStyle(
    fontSize: 9,
    fontFamily: "Cairo",
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,

  );

  static const sTitle = TextStyle(
    fontSize: 25,
    fontFamily: "Cairo",
    fontWeight: FontWeight.w600,
    color: AppColors.blackForText,
  );

  static const sSubTitleGrey = TextStyle(
    fontSize: 13,
    fontFamily: "Cairo",
    fontWeight: FontWeight.normal,
    color: AppColors.greyForIcon,

  );


}
