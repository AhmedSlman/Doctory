import 'package:doctory/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetCodeFormWidget extends StatelessWidget {
  const ResetCodeFormWidget({
    super.key,
    required List<TextEditingController> controllers,
    required List<FocusNode> focusNodes,
  })  : _controllers = controllers,
        _focusNodes = focusNodes;

  final List<TextEditingController> _controllers;
  final List<FocusNode> _focusNodes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 1,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                counterText: "",
                filled: true,
                fillColor: AppColors.whiteColor,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.whiteColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.blueForText),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (value) {
                if (value.length == 1 && index < 3) {
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
