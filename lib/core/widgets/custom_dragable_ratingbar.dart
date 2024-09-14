import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDraggableRatingbar extends StatelessWidget {
  const CustomDraggableRatingbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20.r,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),


      onRatingUpdate: (rating) {},
      updateOnDrag: true,
    );
  }
}
