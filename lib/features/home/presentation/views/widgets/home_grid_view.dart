import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: width * 0.02,
        mainAxisSpacing: height * 0.015,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
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
                    'assets/images/test1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'عرض تنظيف اسنان ',
                  style: AppStyles.sBlack12.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.008),
                child: Row(
                  children: [
                    const Text(
                      '400 جنيه',
                      style: AppStyles.sOldPrice,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                    const Text(
                      '100 جنيه',
                      style: AppStyles.sPrice,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
