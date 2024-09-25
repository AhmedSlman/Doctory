import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:doctory/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    // Check the current locale
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.03),
      child: Stack(
        children: [
          if (showBackButton)
            Positioned(
              // Position the back button based on locale
              left: isRtl ? null : 0,
              right: isRtl ? 0 : null,
              bottom: 1,
              top: 2,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => GoRouter.of(context).pop(),
              ),
            ),
          AnimatedCrossFade(
            duration: const Duration(seconds: 2),
            firstChild: const SizedBox(),
            crossFadeState: CrossFadeState.showSecond,
            secondChild: Center(
              child: Text(
                title ?? '',
                style: AppStyles.sTitle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
