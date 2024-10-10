import 'package:flutter/material.dart';
import 'package:stanch_flutter_task/common/custom_text.dart';

void customSnackBar({
  required BuildContext context,
  required String message,
  bool isError = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomText(text: message),
      backgroundColor: isError ? Colors.red : Colors.green,
    ),
  );
}
