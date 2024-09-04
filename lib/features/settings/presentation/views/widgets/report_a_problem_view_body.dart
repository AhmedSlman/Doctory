import 'package:doctory/core/widgets/custom_app_bar.dart';
import 'package:doctory/features/settings/presentation/views/widgets/upload_image_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import 'report_problem_textfield.dart';

class ReportAProblemViewBody extends StatelessWidget {
  const ReportAProblemViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CustomAppBar(title:S.of(context).reportAProblem,showBackButton: true,),
            SizedBox(
              height:MediaQuery.of(context).size.height * 0.05) ,
             ReportTextField(
              hintText: S.of(context).whatIsYourProblem,
            ),SizedBox(
                height:MediaQuery.of(context).size.height * 0.05) ,
            UploadImageButton(onTap: () {  },),
            SizedBox(
                height:MediaQuery.of(context).size.height * 0.05) ,
            CustomButton(
              width:double.infinity ,
              height: MediaQuery.of(context).size.height * 0.06,
              text: S.of(context).send,
              onPressed: () {  },
            ),

          ],
        ),
      ),
    );
  }
}
