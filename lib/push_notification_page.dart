import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationPage extends StatefulWidget {
  @override
  _PushNotificationPageState createState() => _PushNotificationPageState();
}

class _PushNotificationPageState extends State<PushNotificationPage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String _notificationMessage = '';

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.getToken().then((token) {
      print("Firebase Token: $token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _notificationMessage = message.notification?.body ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notification Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Notification Message:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              _notificationMessage,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
