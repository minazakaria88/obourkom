import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';




void showToastification({
  required String message,
  required BuildContext context,
  required ToastificationType type
})
{
  toastification.show(
    type: type,
    title: Text(message),
    context: context,
    style:  ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 3),
  );
}