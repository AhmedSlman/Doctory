import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_styles.dart';

import '../routes/router_names.dart';
import '../../features/home/data/models/grid_view_item_model.dart';

class CustomGridView extends StatelessWidget {
  final List<GridViewItemModel> items;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomGridView({
    super.key,
    required this.items,
    required this.buttonText,
    required this.onPressed,
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
            double containerHeight = constraints.maxHeight; // Full height of the container
            double imageHeight = containerHeight / 2; // Half of the container height

            return Container(
              height: containerHeight, // Use the full height
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
                          child: Image.asset(
                            item.image,
                            fit: BoxFit.cover, // Adjust fit to cover the area
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
                                      item.oldPrice ?? '',
                                      style: AppStyles.sOldPrice,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                                    Text(
                                      item.newPrice ?? item.address!,
                                      style: item.newPrice != null ? AppStyles.sPrice : AppStyles.s10,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  item.clinicName ?? item.phoneNumber!,
                                  style: AppStyles.s10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.02,
                    bottom: (containerHeight - imageHeight - 25.h) /2,
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
