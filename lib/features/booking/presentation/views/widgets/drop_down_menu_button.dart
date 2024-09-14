import 'package:doctory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class DropDownButtonMenu extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final Function(String?)? onChanged;
  final String? selectedValue;

  const DropDownButtonMenu({
    super.key,
    required this.items,
    required this.hintText,
    this.onChanged,
    this.selectedValue,
  });

  @override
  State<DropDownButtonMenu> createState() => _DropDownButtonMenuState();
}

class _DropDownButtonMenuState extends State<DropDownButtonMenu> {
  String? _selectedValue;
  List<String> _filteredItems = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
    _filteredItems = widget.items;
    _searchController.addListener(() {
      _filterItems();
    });
  }

  void _filterItems() {
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.contains(_searchController.text))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(

        child: DropdownButton<String>(
          dropdownColor: AppColors.whiteColor,
          value: _selectedValue,
          hint: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              widget.hintText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontFamily: "Cairo",
              ),
            ),
          ),
          isExpanded: true,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.primaryColor,
          ),
          iconSize: 28,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontFamily: "Cairo",
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          },
          items: [
            DropdownMenuItem<String>(

              enabled: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'ابحث...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            ..._filteredItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(value),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}


//////////////////////////////////////////////////////////////


// class DropDownButtonMenu2 extends StatefulWidget {
//   const DropDownButtonMenu2({super.key});
//
//   @override
//   State<DropDownButtonMenu2> createState() => _DropDownButtonMenuState2();
// }
//
// class _DropDownButtonMenuState2 extends State<DropDownButtonMenu2> {
//   String? selectedValue;
//
//   final List<String> items = [
//     'Option 6',
//     'Option 7',
//     'Option 8',
//     'Option 9',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width /3,
//       height: 40,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         border: Border.all(
//           color: AppColors.primaryColor,
//           width: 1.5,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: DropdownButton<String>(
//         dropdownColor: AppColors.whiteColor,
//         value: selectedValue,
//         hint: const Padding(
//           padding:  EdgeInsets.all(8.0),
//           child:  Text('عظام'),
//         ),
//         underline:const SizedBox.shrink(),
//         icon: const Icon(Icons.arrow_drop_down_outlined,color: AppColors.primaryColor,),
//         iconSize: 40,
//         elevation: 16,
//         style: const TextStyle(color: AppColors.whiteColor),
//         onChanged: (String? newValue) {
//           setState(() {
//             selectedValue = newValue;
//           });
//         },
//         items: items.map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Text(value,
//                 style: AppStyles.sBlack12,
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }