import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/date_picker.dart';
import 'package:doctory/features/settings/presentation/views/widgets/save_changes_button.dart';

import '../../../../../generated/l10n.dart';

class BookingDialog extends StatelessWidget {
  const BookingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 1.5,
        ),
        padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(S.of(context).booking, style: AppStyles.sBlack15),
                  TextButton(
                    onPressed: () {
                    },
                    child: Text(
                        S.of(context).cancelBooking,
                      style: AppStyles.sBlack12.copyWith(color: AppColors.redColor),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 5.h),
               CustomTextField(
                hintText:  S.of(context).fullPatientName,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
               CustomTextField(
                hintText: S.of(context).phone,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
               CustomTextField(
                hintText: S.of(context).email,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
               SizedBox(height: 3.h),
              const CustomDatePicker(),
               SizedBox(height: 8.h),
              const CustomTimePicker(),
               SizedBox(height: 8.h),
               SaveChangesButton(saveOnPressed: () {  }, cancelOnPressed: () {  },),
               SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}