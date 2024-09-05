import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctory/core/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_styles.dart';

import '../../../data/models/offer_model.dart';



class CustomOffersGridView extends StatelessWidget {
  final List<OffersModel> items;
  final String buttonText;
  final VoidCallback onPressed;
  final bool isButtonOnRight;

  const CustomOffersGridView({
    super.key,
    required this.items,
    required this.buttonText,
    required this.onPressed,
    this.isButtonOnRight = true,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.0008),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
        mainAxisSpacing: MediaQuery.of(context).size.height * 0.015,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return LayoutBuilder(
          builder: (context, constraints) {
            double containerHeight = constraints.maxHeight;
            double imageHeight = containerHeight / 2;

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
                      // Image container taking half the height
                      SizedBox(
                        height: imageHeight,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: item.image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const CustomCircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                      // Column taking the remaining half of the height
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: AppStyles.sBlack12.copyWith(fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.008),
                                child: Row(
                                  children: [
                                    Text(
                                      item.oldPrice,
                                      style: AppStyles.sOldPrice,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                                    Text(
                                      item.price,
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
                                    item.clinicName,
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
                        onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                        ),
                        child: Text(
                          buttonText,
                          style: AppStyles.sTextButton,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}