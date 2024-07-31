import 'package:flutter/material.dart';
import '../../../../../core/utils/app_assets.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.logo,height:40 ,width: 120,),
        ],
      ),
    );
  }
}
