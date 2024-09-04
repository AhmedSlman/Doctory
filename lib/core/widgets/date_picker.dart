import 'package:flutter/material.dart';
import 'package:doctory/core/widgets/custom_text_field.dart';

import '../../generated/l10n.dart';

class CustomDatePicker extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;

  const CustomDatePicker({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late final TextEditingController _dateController;
  late final ValueChanged<String>? _onChanged;

  @override
  void initState() {
    super.initState();
    _dateController = widget.controller ?? TextEditingController();
    _onChanged = widget.onChanged;
  }

  Future<void> selectDate() async {
    DateTime today = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      final formattedDate = "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
      setState(() {
        _dateController.text = formattedDate;
        if (_onChanged != null) {
          _onChanged!(formattedDate);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectDate,
      child: AbsorbPointer(
        child: CustomTextField(
          controller: _dateController,
          prefixIcon: const Icon(Icons.calendar_month_outlined),
          readOnly: true,
          hintText: widget.hintText,
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _dateController.dispose();
    }
    super.dispose();
  }
}

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({super.key});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  final TextEditingController _timeController = TextEditingController();

  Future<void> selectTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        _timeController.text = selectedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectTime,
      child: AbsorbPointer( // Prevents the default keyboard from appearing
        child: CustomTextField(
          controller: _timeController,
          hintText: S.of(context).selectTime, // Example hint text
          prefixIcon: const Icon(Icons.access_time),
          readOnly: true,
        ),
      ),
    );
  }
}