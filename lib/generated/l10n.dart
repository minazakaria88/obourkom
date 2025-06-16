// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `English`
  String get language {
    return Intl.message('English', name: 'language', desc: '', args: []);
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy a smooth and hassle-free moving experience.`
  String get haveFun {
    return Intl.message(
      'Enjoy a smooth and hassle-free moving experience.',
      name: 'haveFun',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number to continue`
  String get phoneNumberToContinue {
    return Intl.message(
      'Enter your phone number to continue',
      name: 'phoneNumberToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get pleaseEnterAValidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'pleaseEnterAValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message('Enter', name: 'enter', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register with us and enter a world of comfort with Obourkom`
  String get registerWithUs {
    return Intl.message(
      'Register with us and enter a world of comfort with Obourkom',
      name: 'registerWithUs',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number *`
  String get phoneNumber {
    return Intl.message(
      'Phone Number *',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Name *`
  String get name {
    return Intl.message('Name *', name: 'name', desc: '', args: []);
  }

  /// `Write your name here`
  String get writeYourNameHere {
    return Intl.message(
      'Write your name here',
      name: 'writeYourNameHere',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid name`
  String get pleaseEnterAValidName {
    return Intl.message(
      'Please enter a valid name',
      name: 'pleaseEnterAValidName',
      desc: '',
      args: [],
    );
  }

  /// `Email *`
  String get email {
    return Intl.message('Email *', name: 'email', desc: '', args: []);
  }

  /// `Please enter a valid email`
  String get pleaseEnterAValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'pleaseEnterAValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the`
  String get iAgreeToThe {
    return Intl.message(
      'I agree to the',
      name: 'iAgreeToThe',
      desc: '',
      args: [],
    );
  }

  /// ` Terms and Conditions `
  String get TermsAndConditions {
    return Intl.message(
      ' Terms and Conditions ',
      name: 'TermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// ` Privacy Policy `
  String get PrivacyPolicy {
    return Intl.message(
      ' Privacy Policy ',
      name: 'PrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(' and ', name: 'and', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Please accept the terms and conditions`
  String get pleaseAcceptTheTermsAndConditions {
    return Intl.message(
      'Please accept the terms and conditions',
      name: 'pleaseAcceptTheTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get otp {
    return Intl.message('OTP', name: 'otp', desc: '', args: []);
  }

  /// `Please enter the 4-digit verification code just sent to you via text message.`
  String get otpText {
    return Intl.message(
      'Please enter the 4-digit verification code just sent to you via text message.',
      name: 'otpText',
      desc: '',
      args: [],
    );
  }

  /// `Code expired in `
  String get codeExpiredIn {
    return Intl.message(
      'Code expired in ',
      name: 'codeExpiredIn',
      desc: '',
      args: [],
    );
  }

  /// `Don't receive the code?`
  String get dontReceiveTheCode {
    return Intl.message(
      'Don\'t receive the code?',
      name: 'dontReceiveTheCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Welcome , `
  String get welcome {
    return Intl.message('Welcome , ', name: 'welcome', desc: '', args: []);
  }

  /// `Main`
  String get main {
    return Intl.message('Main', name: 'main', desc: '', args: []);
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `We cannot determine your location`
  String get weCannotDetermineYourLocation {
    return Intl.message(
      'We cannot determine your location',
      name: 'weCannotDetermineYourLocation',
      desc: '',
      args: [],
    );
  }

  /// `To provide the best service and ease of access, please enable your location`
  String get openGps {
    return Intl.message(
      'To provide the best service and ease of access, please enable your location',
      name: 'openGps',
      desc: '',
      args: [],
    );
  }

  /// `Active Location`
  String get activeLocation {
    return Intl.message(
      'Active Location',
      name: 'activeLocation',
      desc: '',
      args: [],
    );
  }

  /// `Determine Location Manually`
  String get determineLocationManually {
    return Intl.message(
      'Determine Location Manually',
      name: 'determineLocationManually',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Service`
  String get chooseYourService {
    return Intl.message(
      'Choose Your Service',
      name: 'chooseYourService',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Transport of Goods`
  String get transportOfGoods {
    return Intl.message(
      'Transport of Goods',
      name: 'transportOfGoods',
      desc: '',
      args: [],
    );
  }

  /// `Big Car`
  String get bigCars {
    return Intl.message('Big Car', name: 'bigCars', desc: '', args: []);
  }

  /// `Small Car`
  String get smallCars {
    return Intl.message('Small Car', name: 'smallCars', desc: '', args: []);
  }

  /// `Transfer Services`
  String get transferServices {
    return Intl.message(
      'Transfer Services',
      name: 'transferServices',
      desc: '',
      args: [],
    );
  }

  /// `Determine Pickup Location`
  String get DeterminePickupLocation {
    return Intl.message(
      'Determine Pickup Location',
      name: 'DeterminePickupLocation',
      desc: '',
      args: [],
    );
  }

  /// `Determine Delivery Location`
  String get DetermineDeliveryLocation {
    return Intl.message(
      'Determine Delivery Location',
      name: 'DetermineDeliveryLocation',
      desc: '',
      args: [],
    );
  }

  /// `Pickup From`
  String get pickUpFrom {
    return Intl.message('Pickup From', name: 'pickUpFrom', desc: '', args: []);
  }

  /// `Delivery To`
  String get deliveryTo {
    return Intl.message('Delivery To', name: 'deliveryTo', desc: '', args: []);
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `Write your notes here`
  String get writeYourNotesHere {
    return Intl.message(
      'Write your notes here',
      name: 'writeYourNotesHere',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Do you have a discount code?`
  String get doYouHaveADiscountCode {
    return Intl.message(
      'Do you have a discount code?',
      name: 'doYouHaveADiscountCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter discount code`
  String get enterDiscountCode {
    return Intl.message(
      'Enter discount code',
      name: 'enterDiscountCode',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Expected Transportation Cost`
  String get expectedTransportationCost {
    return Intl.message(
      'Expected Transportation Cost',
      name: 'expectedTransportationCost',
      desc: '',
      args: [],
    );
  }

  /// `This cost is estimated and varies according to each representative. It may sometimes increase depending on the distance between the pickup and delivery location. `
  String get costEstimate {
    return Intl.message(
      'This cost is estimated and varies according to each representative. It may sometimes increase depending on the distance between the pickup and delivery location. ',
      name: 'costEstimate',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message('Request', name: 'request', desc: '', args: []);
  }

  /// `Please enter delivery location`
  String get pleaseEnterDeliveryLocation {
    return Intl.message(
      'Please enter delivery location',
      name: 'pleaseEnterDeliveryLocation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter pickup location`
  String get pleaseEnterPickupLocation {
    return Intl.message(
      'Please enter pickup location',
      name: 'pleaseEnterPickupLocation',
      desc: '',
      args: [],
    );
  }

  /// `Please write your notes`
  String get pleaseWriteYourNotes {
    return Intl.message(
      'Please write your notes',
      name: 'pleaseWriteYourNotes',
      desc: '',
      args: [],
    );
  }

  /// `Please choose payment method`
  String get pleaseChoosePaymentMethod {
    return Intl.message(
      'Please choose payment method',
      name: 'pleaseChoosePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Location`
  String get confirmLocation {
    return Intl.message(
      'Confirm Location',
      name: 'confirmLocation',
      desc: '',
      args: [],
    );
  }

  /// `Determined Location`
  String get determinedLocation {
    return Intl.message(
      'Determined Location',
      name: 'determinedLocation',
      desc: '',
      args: [],
    );
  }

  /// `choose From Saved Locations`
  String get chooseFromSavedLocations {
    return Intl.message(
      'choose From Saved Locations',
      name: 'chooseFromSavedLocations',
      desc: '',
      args: [],
    );
  }

  /// `Personal Account`
  String get personalAccount {
    return Intl.message(
      'Personal Account',
      name: 'personalAccount',
      desc: '',
      args: [],
    );
  }

  /// `Addresses`
  String get addresses {
    return Intl.message('Addresses', name: 'addresses', desc: '', args: []);
  }

  /// `Language`
  String get profileLanguage {
    return Intl.message(
      'Language',
      name: 'profileLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `about Us`
  String get aboutUs {
    return Intl.message('about Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Support`
  String get support {
    return Intl.message('Support', name: 'support', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Call US`
  String get callUs {
    return Intl.message('Call US', name: 'callUs', desc: '', args: []);
  }

  /// `Whatsapp`
  String get whatsapp {
    return Intl.message('Whatsapp', name: 'whatsapp', desc: '', args: []);
  }

  /// `Check Privacy Policy`
  String get checkPrivacyPolicy {
    return Intl.message(
      'Check Privacy Policy',
      name: 'checkPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get areYouSureLogout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'areYouSureLogout',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message('Exit', name: 'exit', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `We will permanently delete your account, which will result in the loss of your order history and all your data. Are you sure you want to delete it?`
  String get deleteAccountDesc {
    return Intl.message(
      'We will permanently delete your account, which will result in the loss of your order history and all your data. Are you sure you want to delete it?',
      name: 'deleteAccountDesc',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Type`
  String get type {
    return Intl.message('Type', name: 'type', desc: '', args: []);
  }

  /// `Work`
  String get work {
    return Intl.message('Work', name: 'work', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Add Address`
  String get addAddress {
    return Intl.message('Add Address', name: 'addAddress', desc: '', args: []);
  }

  /// `Please select address type`
  String get pleaseSelectAddressType {
    return Intl.message(
      'Please select address type',
      name: 'pleaseSelectAddressType',
      desc: '',
      args: [],
    );
  }

  /// `Label`
  String get label {
    return Intl.message('Label', name: 'label', desc: '', args: []);
  }

  /// `Please enter label`
  String get pleaseEnterLabel {
    return Intl.message(
      'Please enter label',
      name: 'pleaseEnterLabel',
      desc: '',
      args: [],
    );
  }

  /// `Example: My uncle's house`
  String get labelHint {
    return Intl.message(
      'Example: My uncle\'s house',
      name: 'labelHint',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete your account?`
  String get doYouWantToDeleteYourAccount {
    return Intl.message(
      'Do you want to delete your account?',
      name: 'doYouWantToDeleteYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `No Notifications`
  String get noNotifications {
    return Intl.message(
      'No Notifications',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }

  /// `No Orders`
  String get noOrders {
    return Intl.message('No Orders', name: 'noOrders', desc: '', args: []);
  }

  /// `No Addresses`
  String get noAddresses {
    return Intl.message(
      'No Addresses',
      name: 'noAddresses',
      desc: '',
      args: [],
    );
  }

  /// `No Saved Addresses`
  String get noSavedAddresses {
    return Intl.message(
      'No Saved Addresses',
      name: 'noSavedAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Finding Drivers`
  String get findingDrivers {
    return Intl.message(
      'Finding Drivers',
      name: 'findingDrivers',
      desc: '',
      args: [],
    );
  }

  /// `No Drivers`
  String get noDrivers {
    return Intl.message('No Drivers', name: 'noDrivers', desc: '', args: []);
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `No Drivers Found`
  String get noDriversFound {
    return Intl.message(
      'No Drivers Found',
      name: 'noDriversFound',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Order`
  String get cancelOrder {
    return Intl.message(
      'Cancel Order',
      name: 'cancelOrder',
      desc: '',
      args: [],
    );
  }

  /// `Car Type`
  String get carType {
    return Intl.message('Car Type', name: 'carType', desc: '', args: []);
  }

  /// `Service Type`
  String get serviceType {
    return Intl.message(
      'Service Type',
      name: 'serviceType',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get orderNumber {
    return Intl.message(
      'Order Number',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Looking for offers ...`
  String get lookingForOffers {
    return Intl.message(
      'Looking for offers ...',
      name: 'lookingForOffers',
      desc: '',
      args: [],
    );
  }

  /// `It will take some time ...`
  String get itWillTakeSomeTime {
    return Intl.message(
      'It will take some time ...',
      name: 'itWillTakeSomeTime',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
