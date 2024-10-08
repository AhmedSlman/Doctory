import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctory/core/widgets/custom_app_bar.dart';
import 'package:doctory/features/settings/data/models/reserve_model.dart';
import 'package:doctory/features/settings/view_models/get_reserve_cubit/reservation_cubit.dart';
import 'package:doctory/features/settings/view_models/get_reserve_cubit/reservation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../../generated/l10n.dart';
import '../show_dialogs/rating_dialog.dart';

class BookingTimeViewBody extends StatelessWidget {

  const BookingTimeViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.035,
        ),
        child: Column(
          children: [
            CustomAppBar(
              title: S.of(context).reservationTime,
              showBackButton: true,
            ),
            Expanded(
              child: BlocBuilder<ReservationCubit, ReservationState>(
                builder: (context, state) {
                  if (state is ReservationLoading) {
                    return const CustomCircularProgressIndicator();
                  } else if (state is ReservationError) {
                    return Center(child: Text(state.message));
                  } else if (state is ReservationLoaded) {
                    if (state.appointments.isEmpty) {
                      return Center(
                        child: SvgPicture.asset(
                          'assets/images/empty.svg',
                        ),
                      );
                    } else {
                      return ReservationList(appointment: state.appointments);
                    }
                  } else {
                    return const Center(child: Text('حدثت مشكله تحقق من الانترنت'));


                  }
                },
              ),
            ),
          ],
        ),
      
    );
  }
}

class ReservationList extends StatelessWidget {
  final List<Appointment> appointment;

  const ReservationList({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.019,
        ),
        child: ReservationListViewItem(appointment: appointment[index]),
      ),
      itemCount: appointment.length,
      physics: const BouncingScrollPhysics(),
    );
  }
}


class ReservationListViewItem extends StatelessWidget {
  final Appointment appointment;

  const ReservationListViewItem({super.key, required this.appointment});

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
              height: double.infinity,
              width: screenWidth * 0.3,
              child: CachedNetworkImage(
                 imageUrl: appointment.offer?.image ?? appointment.doctor?.image ?? 'default_image_url',
                fit: BoxFit.cover,
                // placeholder: (context, url) => Skeletonizer(
                //   child: CachedNetworkImage(
                //        imageUrl: bookingModel.offersModel.image,
                //     fit: BoxFit.cover,
                //   ),
              //  ),
                 errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.name,
                    style: AppStyles.sBlack12.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.04,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    appointment.doctor?.specialization.name ?? appointment.offer!.specialization.name,
                    style: AppStyles.sSubTitleGrey.copyWith(
                      fontSize: screenWidth * 0.035,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  const SizedBox(height: 10),
                  Text(
                   appointment.doctor?.name ??appointment.offer!.title,
                    style: AppStyles.sSubTitleGrey.copyWith(
                      fontSize: screenWidth * 0.035,
                    ),
                    softWrap: false,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'سعر الكشف ${appointment.doctor?.price?? appointment.offer!.newPrice} جنيه', // Using price from the OfferModel
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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const RatingScreenDialog();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    ),
                    child: Text(
                      S.of(context).rating,
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

