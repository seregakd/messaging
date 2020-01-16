import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            body: Center(
                child: new HomePage()
            )
        )
    );
  }
}

class HomePage extends StatefulWidget  {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String _homeScreenText = "Waiting for token...";
  Map<String, dynamic> message;

  @override
  Widget build(BuildContext context) {
    print("_homeScreenText: $_homeScreenText");
    return Text(_homeScreenText);
//    return Text(message.toString());
  }

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");



        setState(() {
          _homeScreenText = "onMessage: $message";
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

        final snackbar = SnackBar(
          content: Text(message['notification']['title'] + " " + message['notification']['body']),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () => null,
          ),
        );
        Scaffold.of(context).showSnackBar(snackbar);

        setState(() {
          _homeScreenText = "onLaunch: $message";
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");

        final snackbar = SnackBar(
          content: Text(message['notification']['title'] + " " + message['notification']['body']),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () => null,
          ),
        );
        Scaffold.of(context).showSnackBar(snackbar);

        setState(() {
          _homeScreenText = "onResume: $message";
        });
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));

    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });

    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        _homeScreenText = "Push Messaging token: $token";
      });
      print(_homeScreenText);
    });
  }
}