import 'package:flutter/material.dart';
import 'package:doctory/core/widgets/custom_text_field.dart';

import '../../generated/l10n.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> selectDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _dateController.text = "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
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
          hintText:  S.of(context).selectDate, // Example hint text

        ),
      ),
    );
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