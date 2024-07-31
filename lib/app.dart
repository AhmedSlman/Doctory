import 'package:doctory/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/utils/app_colors.dart';

class Doctory extends StatelessWidget {
  const Doctory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldColor,
      ),
      routerConfig: router,
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
