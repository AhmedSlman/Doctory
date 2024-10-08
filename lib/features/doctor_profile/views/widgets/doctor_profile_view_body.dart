import 'package:doctory/features/doctor_profile/cubit/doctor_profile_cubit.dart';
import 'package:doctory/features/doctor_profile/cubit/doctor_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child: BlocBuilder<DoctorsProfileCubit, DoctorsProfileState>(
        builder: (context, state) {
          if (state is GetDoctorsProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetDoctorsProfileFailure) {
            return Center(
              child: Text(
                'Error: ${state.error.message}', // عرض رسالة الخطأ
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is GetDoctorsProfileSuccess) {
            final doctor = state.doctors; // اختيار أول دكتور من القائمة

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const CustomAppBar(
                    showBackButton: true,
                  ),
                  DoctorProfilePictureAndName(
                    doctor: doctor,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  IconTextWidget(
                    iconPath: 'assets/images/work.svg',
                    primaryText: doctor.price,
                    primaryTextStyle: AppStyles.sBlack12
                        .copyWith(color: AppColors.greyForIcon),
                  ),
                  SizedBox(height: 8.h),
                  IconTextWidget(
                    iconPath: 'assets/images/location.svg',
                    primaryText: doctor.address,
                    primaryTextStyle: AppStyles.sBlack12
                        .copyWith(color: AppColors.greyForIcon),
                  ),
                  SizedBox(height: 5.h),
                  Align(
                    alignment: isRtl ? Alignment.topRight : Alignment.topLeft,
                    child: const CustomRatingBar(
                      rating: 2, // يمكنك تعديله ليعتمد على تقييم الطبيب
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomContainerCard(
                    title: AppStrings.doctorSummary,
                    content: Text(
                      doctor.address,
                      style: AppStyles.sBlack12
                          .copyWith(color: AppColors.greyForIcon),
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const CustomContainerCard(
                    title: AppStrings.doctorServices,
                    content: DoctorServices(
                      services: [], // استبدل بالقائمة الفعلية للخدمات
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
                        IconTextWidget(
                          iconPath: 'assets/images/money.svg',
                          primaryText: 'سعر الكشف',
                          finalText: '${doctor.price} جنيه',
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        IconTextWidget(
                          iconPath: 'assets/images/clock.svg',
                          primaryText: 'وقت الانتظار',
                          finalText: '${doctor.waitingTime} دقيقة',
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        IconTextWidget(
                          iconPath: 'assets/images/location.svg',
                          primaryText: doctor.address,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'الدخول بميعاد معين',
                            style: AppStyles.sBlack12
                                .copyWith(color: AppColors.greyForIcon),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "احجز اونلاين, ادفع في العياده \n الدكتور يشترط الحجز المسبق",
                                style: AppStyles.sBlack12
                                    .copyWith(color: AppColors.greyForIcon),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const Placeholder();
                                    // هنا يمكنك استبدال Placeholder بالحوار الفعلي
                                  },
                                );
                              },
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
            );
          }
          return const SizedBox(); // في حال لم يكن هناك حالة واضحة
        },
      ),
    );
  }
}
