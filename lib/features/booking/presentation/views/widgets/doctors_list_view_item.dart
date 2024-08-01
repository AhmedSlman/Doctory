import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
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
              height: MediaQuery.of(context).size.height * 0.13, // Match container height
              width: MediaQuery.of(context).size.width * 1 / 3,
              child: Image.asset(
                'assets/images/test2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'دكتور احمد علي ',
                  style: AppStyles.sBlack12.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'دكتور عظام ',
                  style: AppStyles.sSubTitleGrey,
                ),
                const SizedBox(height: 3),
                const Text(
                  'المنصورخ ',
                  style: AppStyles.sSubTitleGrey,
                ),
                const SizedBox(height: 3),
                const Text(
                  ' 150 جنيه ',
                  style: AppStyles.sSubTitleGrey,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              RatingBar.builder(
                itemSize:18,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) =>const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.19,
                  height: MediaQuery.of(context).size.height * 0.039,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                    ),
                    child: Text(
                      AppStrings.more,
                      style: AppStyles.sTextButton.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
