
import 'package:doctory/core/utils/app_strings.dart';
import 'package:doctory/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/app_colors.dart';

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
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final String? initialValue;
  final bool enabled; // Added property

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
    this.textStyle,
    this.textAlign,
    this.initialValue,
    this.enabled = true, // Default to true
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle = AppStyles.sSubTitleGrey.copyWith(
      fontSize: 16,
      color: Colors.black,
    );

    return TextFormField(
      initialValue: initialValue,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textAlign: textAlign ?? TextAlign.start,
      obscureText: obsecure,
      onChanged: onChanged,
      onEditingComplete: onEditingCompleted,
      cursorColor: Colors.black,
      readOnly: readOnly,
      enabled: enabled, // Apply the enabled property
      style: textStyle ?? defaultTextStyle,
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
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.blueForText),
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}

class DateTextField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;

  const DateTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
  });

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  late final TextEditingController _controller;
  late final ValueChanged<String>? _onChanged;

  @override
  void initState() {
    super.initState();
    // Use provided controller or create a new one if null
    _controller = widget.controller ?? TextEditingController();
    _onChanged = widget.onChanged;
  }

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
        _controller.text = DateFormat('yyyy-MM-dd').format(selectedDate); // Format date as needed
        if (_onChanged != null) {
          _onChanged(_controller.text);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: widget.hintText,
      onChanged: widget.onChanged,
      textStyle: AppStyles.sSubTitleGrey,
      controller: _controller,
      readOnly: true, // Prevent manual text entry
      onTap: () => _selectBirthDate(context), // Show date picker on tap
      suffixIcon: const Icon(
        Icons.arrow_drop_down_outlined,
        color: AppColors.primaryColor,
      ),
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}



class DropdownTextField extends StatefulWidget {
  final List<String> options;
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
    _selectedValue = widget.selectedValue ?? widget.hintText ?? widget.options.first;
    if (widget.controller != null) {
      widget.controller!.text = _selectedValue;
    }
  }

  @override
  void didUpdateWidget(covariant DropdownTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedValue != oldWidget.selectedValue) {
      setState(() {
        _selectedValue = widget.selectedValue ?? widget.hintText ?? widget.options.first;
        if (widget.controller != null) {
          widget.controller!.text = _selectedValue;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDropdownMenu,
      child: AbsorbPointer(
        child: CustomTextField(
          controller: widget.controller,
          textStyle: widget.textStyle,
          hintText: widget.hintText ?? AppStrings.selectAnOption,
          suffixIcon: const Icon(Icons.arrow_drop_down_outlined, color: AppColors.primaryColor),
          readOnly: true, // Ensure the text field is read-only
        ),
      ),
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

