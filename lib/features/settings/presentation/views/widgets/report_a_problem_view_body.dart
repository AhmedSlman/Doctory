import 'package:doctory/core/widgets/custom_app_bar.dart';
import 'package:doctory/core/widgets/custom_circular_progress_indicator.dart';
import 'package:doctory/core/widgets/custom_toast.dart';
import 'package:doctory/features/settings/presentation/views/widgets/upload_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/report_problem_model.dart';
import '../../view_models/cubit/settings_cubit.dart';
import 'report_problem_textfield.dart';


class ReportAProblemViewBody extends StatelessWidget {
  const ReportAProblemViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsCubit = BlocProvider.of<SettingsCubit>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.025),
        child: Form(
          key: settingsCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: S.of(context).reportAProblem,
                showBackButton: true,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              ReportTextField(
                hintText: S.of(context).whatIsYourProblem,
                controller: settingsCubit.problemText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              UploadImageButton(
                onTap: () => settingsCubit.pickImageFromGallery(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              BlocConsumer<SettingsCubit, SettingsState>(
                listener: (context, state) {
                  if (state is ReportProblemSubmitted) {
                    showToast(msg: 'تم ارسال طلبك بنجاح', color: AppColors.primaryColor);
                    settingsCubit.problemText.clear();
                  } else if (state is ReportProblemSubmitError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMsg)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ReportProblemSubmitting) {
                    return const CustomCircularProgressIndicator();
                  }
                  return CustomButton(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.06,
                    text: S.of(context).send,
                    onPressed: () {
                      if (settingsCubit.formKey.currentState!.validate()) {
                        final reportProblemModel = ReportProblemModel(
                          problemText: settingsCubit.problemText.text,
                          image: settingsCubit.reportProblemModel?.image,
                        );
                        settingsCubit.submitReport(reportProblemModel);
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