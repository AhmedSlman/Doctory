import 'package:doctory/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.03),
      child: Stack(
        children: [
          if (showBackButton)
            Positioned(
              right: 0,
              bottom: 1,
              top: 2,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => GoRouter.of(context).pop()
              ),
            ),
          Center(
            child: Text(
              title ??'',
              style: AppStyles.sTitle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
