import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';  // Import url_launcher
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/models/pharmacies_model.dart';

class CustomPharmaciesGridView extends StatelessWidget {
  final List<PharmaciesModel> items;
  final String buttonText;
  final bool isButtonOnRight;

  const CustomPharmaciesGridView({
    super.key,
    required this.items,
    required this.buttonText,
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
                          child: Image.network(
                            item.image,
                            fit: BoxFit.cover,
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
                                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.01),
                                child: Text(
                                  item.address,
                                  style: AppStyles.sBlack12.copyWith(color: AppColors.greyForIcon),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SizedBox(
                                  width: 92.w,
                                  child: Text(
                                    item.phoneNumber,
                                    style: AppStyles.sBlack12.copyWith(color: AppColors.greyForIcon),
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
                        onPressed: () =>  makePhoneCall(item.phoneNumber), // Handle phone call
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

Future<void> makePhoneCall(String phoneNumber) async {
  print('Requesting phone call permission...');
  final permissionStatus = await Permission.phone.request();

  print('Permission status: $permissionStatus');

  if (permissionStatus.isGranted) {
    print('Permission granted. Proceeding with phone call...');
    final cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    final Uri phoneUri = Uri(scheme: 'tel', path: cleanedNumber);

    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        print('Could not launch $phoneUri');
      }
    } catch (e) {
      print('Exception: $e');
    }
  } else if (permissionStatus.isDenied) {
    print('Phone permission denied');
  } else if (permissionStatus.isPermanentlyDenied) {
    print('Phone permission permanently denied');
    openAppSettings();
  }
}
