import 'package:flutter/material.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'drop_down_menu_button.dart';
import 'doctors_list_view.dart';
import 'location_button.dart';

class BookingViewBody extends StatelessWidget {
  const BookingViewBody({super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03),
      child: Column(children: [
        const CustomAppBar(
          title: AppStrings.booking,
        ),
        Row(
          children: [
            const DropDownButtonMenu(
              items: [
              'جنوب سينا',
              'منصوره',
              'دمياط الجديده ',
              'الاسكندريه',
            ],
              hintText: 'المدينه',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.025,
            ),
            const DropDownButtonMenu(
              items: [
                'عظام',
                'اسنان',
                'انف و اذن ',
                'علاج طبيعي',
              ],
              hintText: 'التخصص',
            ),
            const Spacer(),
            const LocationButton()
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
         const Expanded(child: DoctorsListView())
      ]),
    );
  }
}
