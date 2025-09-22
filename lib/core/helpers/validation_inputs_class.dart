import 'package:flutter/cupertino.dart';

import '../../generated/l10n.dart';

class ValidationClass {
  static String? validateEmail(String? value, BuildContext context) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return S.of(context).pleaseEnterAValidEmail;
    } else {
      return null;
    }
  }

  static String? validatePhone(String? value, BuildContext context) {
    String pattern = r'(^5\d{8}$)';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return S.of(context).pleaseEnterAValidPhoneNumber;
    } else {
      return null;
    }
  }

  static String? validateText(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
