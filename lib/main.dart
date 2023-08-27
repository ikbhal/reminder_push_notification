import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:reminder/push_notification_page.dart';

void main() async {
  // runApp(const MyApp());
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _firebaseMessaging.requestPermission();

     return MaterialApp(
      title: 'Push Notification Demo',
      home: PushNotificationPage(),
    );
    
  
  }
}


