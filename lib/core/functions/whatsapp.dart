import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

Future<void> whatsapp({required String phoneNumber}) async {
  var androidUrl = 'whatsapp://send?phone=$phoneNumber&text=Hi, I need some help';
  var iosUrl =
      "https://wa.me/$phoneNumber?text=${Uri.parse('Hi, I need some help')}";
  String webUrl = 'https://api.whatsapp.com/send/?phone=$phoneNumber&text=hi';
  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
  }
}