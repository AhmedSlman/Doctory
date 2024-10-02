import 'package:doctory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';

class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton({
    super.key,
    required this.cancelOnPressed,
    required this.saveOnPressed,
    this.isLoading = false, // متغير للتحكم في حالة التحميل
  });

  final VoidCallback cancelOnPressed;
  final VoidCallback saveOnPressed;
  final bool isLoading; // متغير لحالة التحميل

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:isLoading ?const CircularProgressIndicator(): CustomButton(
            text:  S.of(context).save, 
            onPressed:  saveOnPressed, 
            height: MediaQuery.of(context).size.height * 0.065,
            width: double.infinity,
            // عرض مؤشر التحميل إذا كان isLoading مفعّلًا
        )
        ),
        const SizedBox(width: 10), // إضافة مسافة بين الأزرار
        Expanded(
          child: CustomButton(
            text: S.of(context).cancel,
            textColor: AppColors.primaryColor,
            onPressed: cancelOnPressed, // تعطيل زر الإلغاء أثناء التحميل
            height: MediaQuery.of(context).size.height * 0.065,
            width: double.infinity,
            buttonColor: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
