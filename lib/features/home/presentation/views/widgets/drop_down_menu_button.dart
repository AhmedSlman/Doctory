
import 'package:doctory/core/utils/app_colors.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DropDownButtonMenu extends StatefulWidget {
  const DropDownButtonMenu({super.key});

  @override
  State<DropDownButtonMenu> createState() => _DropDownButtonMenuState();
}

class _DropDownButtonMenuState extends State<DropDownButtonMenu> {
  String? selectedValue;

  final List<String> items = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width /3,
      height: MediaQuery.of(context).size.height /19,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButton<String>(
        dropdownColor: AppColors.whiteColor,
        value: selectedValue,
        hint: const Padding(
          padding:  EdgeInsets.all(8.0),
          child:  Text('عظام'),
        ),
        underline:const SizedBox.shrink(),
        icon: const Icon(Icons.arrow_drop_down_outlined,color: AppColors.primaryColor,),
        iconSize: 40,
        elevation: 16,
        style: const TextStyle(color: AppColors.whiteColor),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(value,
                style: AppStyles.sBlack12,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

//


class DropDownButtonMenu2 extends StatefulWidget {
  const DropDownButtonMenu2({super.key});

  @override
  State<DropDownButtonMenu2> createState() => _DropDownButtonMenuState2();
}

class _DropDownButtonMenuState2 extends State<DropDownButtonMenu2> {
  String? selectedValue;

  final List<String> items = [
    'Option 6',
    'Option 7',
    'Option 8',
    'Option 9',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width /3,
      height: MediaQuery.of(context).size.height /19,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButton<String>(
        dropdownColor: AppColors.whiteColor,
        value: selectedValue,
        hint: const Padding(
          padding:  EdgeInsets.all(8.0),
          child:  Text('عظام'),
        ),
        underline:const SizedBox.shrink(),
        icon: const Icon(Icons.arrow_drop_down_outlined,color: AppColors.primaryColor,),
        iconSize: 40,
        elevation: 16,
        style: const TextStyle(color: AppColors.whiteColor),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(value,
                style: AppStyles.sBlack12,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}