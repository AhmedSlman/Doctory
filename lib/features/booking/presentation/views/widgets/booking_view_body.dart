import 'package:doctory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../home/presentation/views/widgets/drop_down_menu_button.dart';
import 'doctors_list_view.dart';

class BookingViewBody extends StatelessWidget {
  const BookingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03),
      child: Column(
          children: [
            const CustomAppBar(),
            Row(
              children: [
                const DropDownButtonMenu(),
                SizedBox(
                  width: MediaQuery.of(context).size.width *0.025,
                ),
                const DropDownButtonMenu2(),
               const Spacer(),

                Container(
                  height: MediaQuery.of(context).size.height*0.06,
                  width: MediaQuery.of(context).size.width*0.14,
                  decoration: BoxDecoration(
                    border: Border.all(
                   color: AppColors.primaryColor,
                   width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.whiteColor,
                  ),
                  child:const Icon(Icons.location_on_outlined,
                        color: AppColors.primaryColor,
                    size: 35,

                      )
                ),
              ],
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height*0.015,
            ),
            const Expanded(child:DoctorsListView())


          ]
      ),
    );
  }
}



