import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_rating_bar.dart';
import '../../../data/models/doctor_model.dart';



class DoctorsListViewItem extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorsListViewItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Container(
      height: 140.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: isRTL
                ? const BorderRadius.horizontal(right: Radius.circular(16))
                : const BorderRadius.horizontal(left: Radius.circular(16)),
            child: SizedBox(
              height: double.infinity,
              width: screenWidth * 0.33,
              child: CachedNetworkImage(
                imageUrl: doctor.image,
                fit: BoxFit.cover,
                  placeholder: (context, url) => Skeletonizer(
                    child: CachedNetworkImage(
                      imageUrl: doctor.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error_outline)
              )
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      doctor.name,
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
                      doctor.doctorSpec,
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
                      doctor.address,
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
                      '${doctor.price.toString()} جنيه',
                      style: AppStyles.sSubTitleGrey.copyWith(
                        fontSize: screenWidth * 0.035,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomRatingBar(rating: doctor.rating),
                const SizedBox(height: 20),
                SizedBox(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.04,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(RouterNames.doctorProfileInfo,extra: doctor);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
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
    );
  }
}