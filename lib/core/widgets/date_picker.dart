import 'package:flutter/material.dart';
import 'package:doctory/core/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';
class CustomDatePicker extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<DateTime>? onSelected;
  final String? hintText;
  final DateTime initialDate; // إضافة initialDate

  const CustomDatePicker({
    super.key,
    this.controller,
    this.onSelected,
    this.hintText,
    required this.initialDate, // تعديل هنا
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late final TextEditingController _dateController;
  late final ValueChanged<DateTime>? _onSelected;

  @override
  void initState() {
    super.initState();
    _dateController = widget.controller ?? TextEditingController();
    _onSelected = widget.onSelected;

    // تعيين التاريخ المبدئي في الـ TextField إذا كان محددًا
    final formattedDate = "${widget.initialDate.year}-${widget.initialDate.month}-${widget.initialDate.day}";
    _dateController.text = formattedDate;
  }

  Future<void> selectDate() async {
    DateTime today = DateTime.now();
    
    // استخدم initialDate من الـ widget
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialDate, // تعيين initialDate هنا
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      final formattedDate =
          "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
      setState(() {
        _dateController.text = formattedDate;
        if (_onSelected != null) {
          _onSelected!(selectedDate); 
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
          hintText: widget.hintText ?? S.of(context).booking,
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
  final ValueChanged<String>? onSelected; // Changed to String for formatted time
  final String? hintText;

  const CustomTimePicker({
    super.key,
    this.onSelected,
    this.hintText,
  });

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  final TextEditingController _timeController = TextEditingController();
  late final ValueChanged<String>? _onSelected; // Changed to String

  @override
  void initState() {
    super.initState();
    _onSelected = widget.onSelected;
  }

  Future<void> selectTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        // Format the time to HH:mm
        final now = DateTime.now();
        final selectedDateTime = DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
        final formattedTime = DateFormat('HH:mm').format(selectedDateTime);

        _timeController.text = formattedTime; // Display formatted time
        if (_onSelected != null) {
          _onSelected!(formattedTime); // Send formatted time as a string
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectTime,
      child: AbsorbPointer(
        child: CustomTextField(
          controller: _timeController,
          hintText: widget.hintText ?? S.of(context).selectTime,
          prefixIcon: const Icon(Icons.access_time),
          readOnly: true,
        ),
      ),
    );
  }
}
