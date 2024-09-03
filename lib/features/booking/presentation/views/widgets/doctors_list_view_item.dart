import 'package:doctory/core/routes/router_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_rating_bar.dart';



class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Container(
      height: screenHeight * 0.15,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.whiteColor,
      ),
      child: Directionality(
        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
        child: Row(
          children: [
            if (isRtl)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildTextWidgets(screenWidth),
                  ),
                ),
              ),
            if (!isRtl)
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
                child: Image.asset(
                  'assets/images/test2.png',
                  height: screenHeight * 0.17,
                  width: screenWidth * 0.33,
                  fit: BoxFit.cover,
                ),
              ),
            if (isRtl)
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
                child: Image.asset(
                  'assets/images/test2.png',
                  height: screenHeight * 0.17,
                  width: screenWidth * 0.33,
                  fit: BoxFit.cover,
                ),
              ),
            if (!isRtl)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildTextWidgets(screenWidth),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomRatingBar(),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: screenWidth * 0.2,
                    height: screenHeight * 0.04,
                    child: ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push(RouterNames.doctorProfileInfo);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      ),
                      child: Text(
                        AppStrings.more,
                        style: AppStyles.sTextButton.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.03,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTextWidgets(double screenWidth) {
    return [
      Flexible(
        child: Text(
          'دكتور احمد علي',
          style: AppStyles.sBlack12.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.04,
          ),
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ),
      const SizedBox(height: 5),
      Flexible(
        child: Text(
          'دكتور عظام',
          style: AppStyles.sSubTitleGrey.copyWith(
            fontSize: screenWidth * 0.035,
          ),
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ),
      const SizedBox(height: 3),
      Flexible(
        child: Text(
          'المنصورة',
          style: AppStyles.sSubTitleGrey.copyWith(
            fontSize: screenWidth * 0.035,
          ),
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ),
      const SizedBox(height: 3),
      Flexible(
        child: Text(
          '150 جنيه',
          style: AppStyles.sSubTitleGrey.copyWith(
            fontSize: screenWidth * 0.035,
          ),
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ),
    ];
  }
}
