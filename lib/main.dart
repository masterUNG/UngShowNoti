import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:unghshownoiti/states/main_home.dart';

Map<String, WidgetBuilder> map = {
  '/mainHome': (BuildContext context) => const MainHome(),
};

String? firstState;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    print('initial Work');
    // FirebaseMessaging.onBackgroundMessage(
    //     (message) => firebaseMessageBackgroundHandler(message));
    firstState = '/mainHome';
    runApp(const MyApp());
  });
}

Future<void> firebaseMessageBackgroundHandler(RemoteMessage message) async {
  print('message from Background ==>> ');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: firstState,
    );
  }
}
