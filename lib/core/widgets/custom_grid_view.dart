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
  final VoidCallback onPressed; // Add a callback for the button

  const CustomGridView({
    super.key,
    required this.items,
    required this.buttonText,
    required  this.onPressed, // Add a callback for the button

  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GridView.builder(
      physics: const BouncingScrollPhysics(), // Prevent internal scrolling
      padding: EdgeInsets.symmetric(horizontal: width * 0.0008),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: width * 0.02,
        mainAxisSpacing: height * 0.015,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Stack(
          children: [
            Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                    child: SizedBox(
                      height: height * 0.12,
                      width: double.infinity,
                      child: Image.asset(
                        item.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      item.title,
                      style: AppStyles.sBlack12.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.008),
                    child: Row(
                      children: [
                        Text(
                          item.oldPrice ?? '',
                          style: AppStyles.sOldPrice,
                        ),
                        SizedBox(width: width * 0.005),
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
            Positioned(
              left: width * 0.025,
              bottom: height * 0.03,
              child: SizedBox(
                width: 60.w,
                height: 25.h,
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
        );
      },
    );
  }
}
