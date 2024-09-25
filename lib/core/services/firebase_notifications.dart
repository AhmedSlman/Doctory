// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';

// class FireBaseNotifications {
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     String? token = await _firebaseMessaging.getToken();
//     if (kDebugMode) {
//       print('token:$token');
//     }
//     //handleBackgroundNotifications();
//   }

//   void handleMessage(RemoteMessage? message) async {
//     if (message == null) return;
//     //GoRouter.of(context).pushReplacement(RouterNames.pharmaciesScreen);
//   }

//   Future handleBackgroundNotifications() async {
//     _firebaseMessaging.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     return null;
//   }
// }
