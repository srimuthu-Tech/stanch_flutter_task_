import 'package:flutter/material.dart';
import 'package:stanch_flutter_task/common/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final void Function() onTap;

  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue, width: 2)),
        child: Center(
            child: CustomText(
          text: text,
          color: Colors.white,
        )),
      ),
    );
  }
}
