import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/date_picker.dart';
import 'package:doctory/features/settings/presentation/views/widgets/save_changes_button.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(AppStrings.booking, style: AppStyles.sBlack15),
                  TextButton(
                    onPressed: () {
                    },
                    child: Text(
                      AppStrings.cancelBooking,
                      style: AppStyles.sBlack12.copyWith(color: AppColors.redColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const CustomTextField(
                hintText: 'اسم المريض بالكامل',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const CustomTextField(
                hintText: 'رقم الهاتف',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const CustomTextField(
                hintText: 'البريد الالكتروني',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const SizedBox(height: 8),
              const CustomDatePicker(),
              const SizedBox(height: 8),
              const CustomTimePicker(),
              const SizedBox(height: 8),
              const SaveChangesButton(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}