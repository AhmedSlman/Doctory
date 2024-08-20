import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/core/widgets/custom_app_bar.dart';
import 'package:doctory/core/widgets/custom_rating_bar.dart';
import 'package:doctory/core/widgets/rating_box.dart';
import 'package:doctory/features/doctor_profile/views/widgets/profile_picture_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_strings.dart';
import 'custom_container_card.dart';
import 'doctor_services.dart';
import 'icon_text_widget.dart';

class DoctorProfileViewBody extends StatelessWidget {
  const DoctorProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CustomAppBar(
              showBackButton: true,
            ),
            const DoctorProfilePictureAndName(),
            SizedBox(
              height: 15.h,
            ),
            IconTextWidget(
              iconPath: 'assets/images/work.svg',
              primaryText: 'دكتور عظام',
              primaryTextStyle:
                  AppStyles.sBlack12.copyWith(color: AppColors.greyForIcon),
            ),
            SizedBox(height: 8.h),
            IconTextWidget(
              iconPath: 'assets/images/location.svg',
              primaryText: 'المنصوره',
              primaryTextStyle:
                  AppStyles.sBlack12.copyWith(color: AppColors.greyForIcon),
            ),
            SizedBox(height: 5.h),
            const Align(
              alignment: Alignment.topRight,
              child: CustomRatingBar(),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomContainerCard(
              title: AppStrings.doctorSummary,
              content: Text(
                'ليو ميسي',
                style:
                    AppStyles.sBlack12.copyWith(color: AppColors.greyForIcon),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            const CustomContainerCard(
              title: AppStrings.doctorServices,
              content: DoctorServices(
                services: ['عظام', 'اسنان', 'اشعه', 'علاج طبيعي'],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomContainerCard(
              title: AppStrings.infoAboutReservation,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IconTextWidget(
                    iconPath: 'assets/images/money.svg',
                    primaryText: 'سعر الكشف',
                    finalText: '200 جنيه',
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const IconTextWidget(
                    iconPath: 'assets/images/clock.svg',
                    primaryText: 'وقت الانتظار',
                    finalText: '15 دقيقه',
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const IconTextWidget(
                    iconPath: 'assets/images/location.svg',
                    primaryText: 'المنصوره شارع الترعه امام اهل الشام',
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'الدخول بميعاد معين',
                      style: AppStyles.sSubTitleGrey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "احجز اونلاين, ادفع في العياده \n الدكتور يشترط الحجز المسبق",
                          style: AppStyles.sSubTitleGrey,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          AppStrings.bookNow,
                          style: AppStyles.sTextButton,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomContainerCard(
              title: AppStrings.customersOpinions,
              content: SizedBox(
                height: 300.h, // Adjust height as needed
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RatingBox(),
                    ); // Example widget
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
