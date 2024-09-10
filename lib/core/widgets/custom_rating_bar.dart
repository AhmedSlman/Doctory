import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomRatingBar extends StatelessWidget {
  final double? rating;

  const CustomRatingBar({super.key, this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating ?? 0.0,
      itemSize: 16.r,
      direction: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
  }
}
