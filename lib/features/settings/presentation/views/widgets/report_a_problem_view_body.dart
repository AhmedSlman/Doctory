import 'dart:io';

import 'package:doctory/core/widgets/custom_app_bar.dart';
import 'package:doctory/core/widgets/custom_circular_progress_indicator.dart';
import 'package:doctory/core/widgets/custom_toast.dart';
import 'package:doctory/features/settings/presentation/views/widgets/upload_image_button.dart';
import 'package:doctory/features/settings/view_models/problam_cubit/problam_cubit.dart';
import 'package:doctory/features/settings/view_models/problam_cubit/problam_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/report_problem_model.dart';
import '../../../view_models/cubit/settings_cubit.dart';
import 'report_problem_textfield.dart';



class ReportAProblemViewBody extends StatelessWidget {
  const ReportAProblemViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final reportProblemCubit = BlocProvider.of<ReportProblemCubit>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.025),
        child: Form(
          key: reportProblemCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: S.of(context).reportAProblem,
                showBackButton: true,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              // حقل النص مع validator
              ReportTextField(
                hintText: S.of(context).whatIsYourProblem,
                controller: reportProblemCubit.problemText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).validatorMsg;
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              // زر اختيار الصورة
              UploadImageButton(
                onTap: () => reportProblemCubit.getImage(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),

              // عرض الصورة المختارة أو رسالة الخطأ
              BlocBuilder<ReportProblemCubit, ReportProblemState>(
                builder: (context, state) {
                  if (state is ReportImagePickedSuccess) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.21,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.greyColor, // لون افتراضي
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              File(state.imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                        GestureDetector(
                          onTap: () {
                            reportProblemCubit.clearImage(); // إعادة تعيين الصورة
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.21,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.whiteColor,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.delete,
                                color: AppColors.primaryColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Container(); // عدم عرض شيء إذا لم يتم اختيار صورة
                },
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.04),

              // زر الإرسال مع التعامل مع حالة الـ Cubit
              BlocConsumer<ReportProblemCubit, ReportProblemState>(
                listener: (context, state) {
                  if (state is ReportProblemSuccess) {
                    showToast(
                        msg: 'تم ارسال طلبك بنجاح',
                        color: AppColors.primaryColor);
                    reportProblemCubit.clearFields(); // تفريغ الحقول بعد النجاح
                  } else if (state is ReportProblemFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ReportProblemLoading) {
                    return const CustomCircularProgressIndicator(); // عرض مؤشر تحميل
                  }
                  return CustomButton(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.06,
                    text: S.of(context).send,
                    onPressed: () {
                      // التحقق من صحة المدخلات قبل الإرسال
                      if (reportProblemCubit.formKey.currentState!.validate()) {
                        if (reportProblemCubit.file != null) {
                          // استدعاء reportProblem إذا كانت القيم صالحة
                          reportProblemCubit.reportProblem(  );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please select an image')),
                          );
                        }
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

