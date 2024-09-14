import 'package:flutter/material.dart';
import '../../../../../core/utils/app_assets.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical:MediaQuery.of(context).size.height *0.03
          ,
          horizontal: MediaQuery.of(context).size.width*0.015

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedCrossFade(
            duration: const Duration(seconds: 2),
            firstChild: const SizedBox(),
            crossFadeState: CrossFadeState.showSecond,
            secondChild: Image.asset(AppAssets.logo,
              height:40 ,
              width: 120,
            ),

          ),
        ],
      ),
    );
  }
}







/*




*/

