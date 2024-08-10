import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/widgets/custom_app_bar.dart';
import 'package:doctory/core/widgets/custom_button.dart';
import 'package:doctory/features/settings/presentation/views/widgets/save_changes_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class PersonalInfoViewBody extends StatelessWidget {
  const PersonalInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: AppStrings.personalInformation, showBackButton: true),
          const SizedBox(height: 40),
          const CustomTextField(
            hintText: 'احمد محمد علي',
          ),
          const SizedBox(height: 15),
          const CustomTextField(
            hintText: '012012551512',
          ),
          const SizedBox(height: 15),
          const CustomTextField(
            hintText: 'ahmedmohamedali@gmail.com',
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: BirthDateTextField(),
              ),
              const SizedBox(width: 15), // Adjust spacing between fields
              Expanded(
                flex: 1, // Adjust the flex if needed
                child: DropdownTextField(
                  options: const [
                    AppStrings.male,
                    AppStrings.female,
                  ],
                  hintText: 'ذكر',
                  textStyle: AppStyles.sSubTitleGrey,
                  onChanged: (value) {
                    print('Selected value: $value');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const SaveChangesButton(),
        ],
      ),
    );
  }
}





