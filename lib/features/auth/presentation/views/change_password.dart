import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/core/widgets/custom_button.dart';
import 'package:doctory/features/auth/presentation/widgets/auth_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * 0.3),
            const ChangePasswordAppBarWidget(),
            SizedBox(height: MediaQuery.of(context).size.width * 0.25),
            const AuthTextFormFieldWidget(hintText: "كلمة المرور الجديدة"),
            SizedBox(height: MediaQuery.of(context).size.width * 0.05),
            const AuthTextFormFieldWidget(
                hintText: "تأكيد كلمة المرور الجديدة"),
            SizedBox(height: MediaQuery.of(context).size.width * 0.07),
            CustomButton(
              text: "انتهيت",
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.07,
              onPressed: () {
                context.go(RouterNames.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordAppBarWidget extends StatelessWidget {
  const ChangePasswordAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.go(RouterNames.login);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackForText,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Text(
          'تغيير كلمة المرور',
          style: AppStyles.s18.copyWith(color: AppColors.blackForText),
        ),
      ],
    );
  }
}
