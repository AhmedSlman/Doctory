import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_strings.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordAppBar extends StatelessWidget {
  const ForgetPasswordAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.go(RouterNames.login);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Column(
          children: [
            Text(
              AppStrings.forgotPassword,
              style: AppStyles.s18.copyWith(color: AppColors.blackForText),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: ' يرجى إدخال الرمز المرسل في رسالة نصية\n  علي الرقم ',
                  style: DefaultTextStyle.of(context).style,
                  children: const <TextSpan>[
                    TextSpan(
                      text: '+01326452514',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
