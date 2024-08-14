import 'package:doctory/core/utils/app_strings.dart';
import 'package:doctory/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../booking/presentation/views/widgets/doctors_list_view.dart';

class BookingTimeViewBody extends StatelessWidget {
  const BookingTimeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child: const Column(
        children: [
          CustomAppBar(
            title: AppStrings.reservationTime,
            showBackButton: true,
          ),
          Expanded(child: ReservationList())
        ],
      ),
    );
  }
}

class ReservationList extends StatelessWidget {
  const ReservationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.019),
        child: const ReservationListViewItem(),
      ),
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
    );
  }
}

class ReservationListViewItem extends StatelessWidget {
  const ReservationListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.19,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(right: Radius.circular(16)),
            child: SizedBox(
              height: double.infinity, // Make the image take the full height of the container
              width: screenWidth * 0.3,
              child: Image.asset(
                'assets/images/test2.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'الدكتورة سناء',
                    style: AppStyles.sBlack12.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.04,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'دكتوره اسنان',
                    style: AppStyles.sSubTitleGrey.copyWith(
                      fontSize: screenWidth * 0.035,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'يوم السبت الساعه 1 مساء',
                    style: AppStyles.sSubTitleGrey.copyWith(
                      fontSize: screenWidth * 0.035,
                    ),
                    softWrap: false,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'سعر الكشف 200 جنيه',
                    style: AppStyles.sSubTitleGrey.copyWith(
                      fontSize: screenWidth * 0.035,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
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
                const SizedBox(height: 20),
                SizedBox(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.04,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    ),
                    child: Text(
                      AppStrings.rating,
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
