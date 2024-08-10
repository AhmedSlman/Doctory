
import 'package:doctory/core/utils/app_strings.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onEditingCompleted;
  final ValueChanged<String>? onFieldSubmitted;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextStyle? textStyle; // Added property for text style

  const CustomTextField({
    super.key,
    this.controller,
    this.validator,
    this.obsecure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.onEditingCompleted,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.onTap,
    this.textStyle, // Initialize text style
  });

  @override
  Widget build(BuildContext context) {
    // Define a default text style
    final TextStyle defaultTextStyle = AppStyles.sSubTitleGrey.copyWith(
      fontSize: 16, // Default font size
      color: Colors.black, // Default text color
    );

    return TextFormField(
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obsecure,
      onChanged: onChanged,
      onEditingComplete: onEditingCompleted,
      cursorColor: Colors.black,
      readOnly: readOnly,
      style: textStyle ?? defaultTextStyle, // Use custom style if provided, otherwise use default
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: AppStyles.sSubTitleGrey,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        filled: true,
        fillColor: AppColors.whiteColor,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.whiteColor),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.blueForText),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

class BirthDateTextField extends StatefulWidget {
  const BirthDateTextField({super.key});

  @override
  State<BirthDateTextField> createState() => _BirthDateTextFieldState();
}

class _BirthDateTextFieldState extends State<BirthDateTextField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectBirthDate(BuildContext context) async {
    final DateTime today = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: today.subtract(const Duration(days: 365 * 20)),
      firstDate: DateTime(1900),
      lastDate: today,
    );

    if (selectedDate != null && selectedDate.isBefore(today)) {
      setState(() {
        _controller.text = '${selectedDate.toLocal()}'.split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textStyle: AppStyles.sSubTitleGrey,

      controller: _controller,
      readOnly: true, // Prevent manual text entry
      onTap: () => _selectBirthDate(context), // Show date picker on tap
      suffixIcon: const Icon(Icons.arrow_drop_down_outlined,color: AppColors.primaryColor,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}




class DropdownTextField extends StatefulWidget {
  final List<String> options; // List of dropdown options
  final String? hintText;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;

  const DropdownTextField({
    super.key,
    required this.options,
    this.hintText,
    this.controller,
    this.textStyle,
    this.selectedValue,
    this.onChanged,
  });

  @override
  State<DropdownTextField> createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue ?? widget.options.first;
    if (widget.controller != null) {
      widget.controller!.text = _selectedValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      textStyle: widget.textStyle,
      hintText: widget.hintText ?? AppStrings.selectAnOption,
      readOnly: true, // Prevent manual text entry
      onTap: _showDropdownMenu,
      suffixIcon: const Icon(Icons.arrow_drop_down_outlined, color: AppColors.primaryColor),
    );
  }

  void _showDropdownMenu() async {
    final String? selected = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text(AppStrings.selectAnOption),
          children: widget.options.map((String option) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, option);
              },
              child: Text(option),
            );
          }).toList(),
        );
      },
    );

    if (selected != null && selected != _selectedValue) {
      setState(() {
        _selectedValue = selected;
        if (widget.controller != null) {
          widget.controller!.text = _selectedValue;
        }
        if (widget.onChanged != null) {
          widget.onChanged!(_selectedValue);
        }
      });
    }
  }
}
