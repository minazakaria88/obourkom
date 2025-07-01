import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showSnackBar({
  required String message,
  required BuildContext context,
  required String title,
  required ContentType contentType,
}) {
  final snackBar = SnackBar(
    elevation: 0,
    margin: const EdgeInsets.only(
      top: 20,   // Distance from top
      left: 16,
      right: 16,
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    duration: const Duration(milliseconds: 600),
    content: AwesomeSnackbarContent(
      inMaterialBanner: true,
      title: title,
      message: message,
      contentType: contentType,
    ),
  );
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}


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