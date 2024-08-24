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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Doctory`
  String get appName {
    return Intl.message(
      'Doctory',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To`
  String get welcome {
    return Intl.message(
      'Welcome To',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Lets Start`
  String get letsStart {
    return Intl.message(
      'Lets Start',
      name: 'letsStart',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code sent via SMS \n to the number`
  String get pinCodeMessage {
    return Intl.message(
      'Please enter the code sent via SMS \n to the number',
      name: 'pinCodeMessage',
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

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get mobileNumber {
    return Intl.message(
      'Phone Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message(
      'Book Now',
      name: 'bookNow',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Booking`
  String get cancelBooking {
    return Intl.message(
      'Cancel Booking',
      name: 'cancelBooking',
      desc: '',
      args: [],
    );
  }

  /// `Booking`
  String get booking {
    return Intl.message(
      'Booking',
      name: 'booking',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homePage {
    return Intl.message(
      'Home',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacies`
  String get pharmacies {
    return Intl.message(
      'Pharmacies',
      name: 'pharmacies',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message(
      'Call',
      name: 'call',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Booking Times`
  String get bookingTime {
    return Intl.message(
      'Booking Times',
      name: 'bookingTime',
      desc: '',
      args: [],
    );
  }

  /// `Report a Problem`
  String get sendProblem {
    return Intl.message(
      'Report a Problem',
      name: 'sendProblem',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Select Gender`
  String get selectAnOption {
    return Intl.message(
      'Select Gender',
      name: 'selectAnOption',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reservation Times`
  String get reservationTime {
    return Intl.message(
      'Reservation Times',
      name: 'reservationTime',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Your Rating`
  String get yourRating {
    return Intl.message(
      'Your Rating',
      name: 'yourRating',
      desc: '',
      args: [],
    );
  }

  /// `Report a Problem`
  String get reportAProblem {
    return Intl.message(
      'Report a Problem',
      name: 'reportAProblem',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Services`
  String get doctorServices {
    return Intl.message(
      'Doctor Services',
      name: 'doctorServices',
      desc: '',
      args: [],
    );
  }

  /// `Information about Reservation`
  String get infoAboutReservation {
    return Intl.message(
      'Information about Reservation',
      name: 'infoAboutReservation',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Summary`
  String get doctorSummary {
    return Intl.message(
      'Doctor Summary',
      name: 'doctorSummary',
      desc: '',
      args: [],
    );
  }

  /// `Examination Price`
  String get examinationPrice {
    return Intl.message(
      'Examination Price',
      name: 'examinationPrice',
      desc: '',
      args: [],
    );
  }

  /// `Waiting Time`
  String get waitingTime {
    return Intl.message(
      'Waiting Time',
      name: 'waitingTime',
      desc: '',
      args: [],
    );
  }

  /// `Customer Opinions`
  String get customersOpinions {
    return Intl.message(
      'Customer Opinions',
      name: 'customersOpinions',
      desc: '',
      args: [],
    );
  }

  /// `Upload Photo`
  String get uploadPhoto {
    return Intl.message(
      'Upload Photo',
      name: 'uploadPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Full Patient Name`
  String get fullPatientName {
    return Intl.message(
      'Full Patient Name',
      name: 'fullPatientName',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message(
      'Select Date',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Select Time`
  String get selectTime {
    return Intl.message(
      'Select Time',
      name: 'selectTime',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `What is your problem?`
  String get whatIsYourProblem {
    return Intl.message(
      'What is your problem?',
      name: 'whatIsYourProblem',
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
