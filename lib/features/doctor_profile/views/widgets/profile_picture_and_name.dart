import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctory/features/doctor_profile/data/model/doctor_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';

class DoctorProfilePictureAndName extends StatelessWidget {
  const DoctorProfilePictureAndName({super.key, required this.doctor});
  final DoctorProfileModel doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: doctor.image ?? 'default_image_url',
          imageBuilder: (context, imageProvider) => Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(doctor.name, style: AppStyles.sTitle),
      ],
    );
  }
}
