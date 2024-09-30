import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/offers_by_specialization/offers_by_specialization_cubit.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/offers_by_specialization/offers_by_specialization_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/offer_model.dart';

class CustomOffersGridView extends StatefulWidget {
  final Function(OffersModel) onPressed;
  final String categoryName;

  const CustomOffersGridView({
    super.key,
    required this.onPressed,
    required this.categoryName,
  });

  @override
  _CustomOffersGridViewState createState() => _CustomOffersGridViewState();
}

class _CustomOffersGridViewState extends State<CustomOffersGridView> {
  @override
  void didUpdateWidget(covariant CustomOffersGridView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.categoryName != widget.categoryName) {
      context.read<OffersBySpecCubit>().fetchOffersBySpecialization(widget.categoryName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OffersBySpecCubit, OffersBySpecState>(
      listener: (context, state) {
        // يمكن استخدام listener هنا للتعامل مع حالات أخرى إذا لزم الأمر
      },
      builder: (context, state) {
        if (state is OffersBySpacLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OffersBySpacSuccess) {
          final offers = state.offer;
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.0008),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
              mainAxisSpacing: MediaQuery.of(context).size.height * 0.015,
            ),
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final item = offers[index];
              return LayoutBuilder(
                builder: (context, constraints) {
                  double containerHeight = constraints.maxHeight;
                  double imageHeight = containerHeight / 2;

                  return CustomOfferCard(
                    containerHeight: containerHeight,
                    imageHeight: imageHeight,
                    offer: item,
                    onPressed: (item) => widget.onPressed(item),
                  );
                },
              );
            },
          );
        } else if (state is OffersBySpacFailure) {
          return Center(child: Text('Error: ${state.error}'));
        }

        return const SizedBox.shrink();
      },
    );
  }
}


class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({
    super.key,
    required this.containerHeight,
    required this.imageHeight,
    required this.offer,
    required this.onPressed,
  });

  final double containerHeight;
  final double imageHeight;
  final OffersModel  offer;
  final void Function(OffersModel offer) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: imageHeight,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: offer.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Skeletonizer(
                      child: CachedNetworkImage(
                        imageUrl: offer.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.title,
                        style: AppStyles.sBlack12.copyWith(fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.008),
                        child: Row(
                          children: [
                            Text(
                              offer.oldPrice,
                              style: AppStyles.sOldPrice,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                            Text(
                              offer.newPrice,
                              style: AppStyles.sPrice,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SizedBox(
                          width: 92.w,
                          child: Text(
                            offer.specialization!.name,
                            style: AppStyles.s10,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: Directionality.of(context) == TextDirection.rtl
                ? MediaQuery.of(context).size.width * 0.02
                : null,
            right: Directionality.of(context) == TextDirection.ltr
                ? MediaQuery.of(context).size.width * 0.02
                : null,
            bottom: (containerHeight - imageHeight - 25.h) / 2,
            child: SizedBox(
              width: 60.w,
              height: 25.h, // Fixed height
              child: ElevatedButton(
               onPressed:  () => (){},
                style: ElevatedButton.styleFrom(
                 // backgroundColor: item.isBooked ? Colors.grey : AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                ),
                child: Text(
                  S.of(context).booked ,
                  style: AppStyles.sTextButton,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
