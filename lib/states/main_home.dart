import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setUpFirebaseMessage();

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message reciev ed");
      print(event.notification!.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }

  Future<void> setUpFirebaseMessage() async {
    print('setUp Work');
    await FirebaseMessaging.onMessage.listen((event) {
      print('Have Message ==>> ${event.data}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Home'),
      ),
    );
  }
}
