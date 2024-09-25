import 'package:doctory/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class AppLogoSection extends StatelessWidget {
  const AppLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.logo);
  }
}
