import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

Future<void> handleBackgroundMsg(RemoteMessage message) async {
  if (kDebugMode) {
    print('title:${message.notification?.title}');
  }
  if (kDebugMode) {
    print('body:${message.notification?.body}');
  }
  if (kDebugMode) {
    print('Payload:${message.data}');
  }
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmtoken = await _firebaseMessaging.getToken();
    if (kDebugMode) {
      print('token:$fcmtoken');
    }
    await _firebaseMessaging.subscribeToTopic('news');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMsg);
  }
}
