// ignore_for_file: library_private_types_in_public_api

import 'package:doctory/core/routes/app_router.dart';
import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/utils/app_assets.dart';
import 'package:doctory/core/widgets/custom_button.dart';
import 'package:doctory/features/auth/presentation/widgets/forget_password_app_bar.dart';
import 'package:doctory/features/auth/presentation/widgets/reset_code_form_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({super.key});

  final _controllers = List.generate(4, (_) => TextEditingController());

  final _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ForgetPasswordAppBar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            ResetCodeFormWidget(
              controllers: _controllers,
              focusNodes: _focusNodes,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Image.asset(AppAssets.resetCodeImage),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.07,
              text: "ارسال",
              onPressed: () {
                final code = _controllers.map((c) => c.text).join();
                if (kDebugMode) {
                  print("Entered Code: $code");
                }
                context.go(RouterNames.changePassword);
              },
            ),
          ],
        ),
      ),
    );
  }
}
