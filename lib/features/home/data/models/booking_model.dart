import 'package:flutter/material.dart'; // For TimeOfDay
import 'package:intl/intl.dart'; // For DateFormat
import 'offer_model.dart';

class BookingModel {
  final String offerId;
  final String userId;
  final String patientName;
  final String phone;
  final String email;
  final DateTime bookingDate;
  final String bookingTime; // Store time as "h:mm a" format
  final OffersModel offersModel;


  BookingModel({
    required this.offerId,
    required this.userId,
    required this.patientName,
    required this.phone,
    required this.email,
    required this.bookingDate,
    required this.bookingTime,
    required this.offersModel,

  });

  Map<String, dynamic> toFirestore() {
    return {
      'offerId': offerId,
      'userId': userId,
      'patientName': patientName,
      'phone': phone,
      'email': email,
      'bookingDate': bookingDate.toIso8601String(),
      'bookingTime': bookingTime, // Store time as "h:mm a"
      'offersModel': offersModel.toMap(),
    };
  }

  factory BookingModel.fromFirestore(Map<String, dynamic> data) {
    return BookingModel(
      offerId: data['offerId'],
      userId: data['userId'],
      patientName: data['patientName'],
      phone: data['phone'],
      email: data['email'],
      bookingDate: DateTime.parse(data['bookingDate']),
      bookingTime: data['bookingTime'], // Time as "h:mm a"
      offersModel: OffersModel.fromFirestore(
        data['offersModel'] as Map<String, dynamic>,
        data['offersModel']['id'] as String,
      ),
    );
  }

  // Convert TimeOfDay to "h:mm a" format
  static String timeOfDayToString(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
    return DateFormat('h:mm a').format(dateTime);
  }

  // Convert "h:mm a" format to TimeOfDay
  static TimeOfDay stringToTimeOfDay(String timeString) {
    final dateTime = DateFormat('h:mm a').parse(timeString);
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }
}
