import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            body: Center(
                child: Container(
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(),
                    ),
                    height: 300,
                    child: new CardWidget()))));
  }
}

class CardWidget extends StatelessWidget {
  static const double sizeSmallIcon = 30;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.account_circle, size: 50),
            ),
            Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Flutter McFlutter',
                      style: Theme.of(context).textTheme.headline),
                  Text('app developer')
                ])
          ]),
          SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('123 Main Street'),
            Text('(415) 555-0198'),
          ]),
          SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Icon(Icons.accessibility, size: sizeSmallIcon),
            Icon(Icons.timer, size: sizeSmallIcon),
            Icon(Icons.phone_android, size: sizeSmallIcon),
            Icon(Icons.phone_iphone, size: sizeSmallIcon)
          ])
        ]);
  }
}
