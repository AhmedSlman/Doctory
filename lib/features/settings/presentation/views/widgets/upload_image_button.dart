import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_strings.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class UploadImageButton extends StatelessWidget {
  const UploadImageButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap ,
      child: Container(
        width: MediaQuery.of(context).size.width*0.21,
        height: MediaQuery.of(context).size.height*0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){}, icon:const Icon(Icons.photo_camera_outlined,color: AppColors.primaryColor,)),
            Text(
              S.of(context).uploadPhoto,
              style:AppStyles.s10.copyWith(color: AppColors.primaryColor,),
            )
          ],
        ),

      ),
    );
  }
}
