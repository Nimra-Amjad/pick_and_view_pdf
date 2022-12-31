import 'package:fcm_push_notification/file_pick_and_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(name: "fcm-push-notifi"
  //     // options: const FirebaseOptions(
  //     //     apiKey: "",
  //     //     appId: "1:1046865707209:android:1706252f928b9eeff78d18",
  //     //     messagingSenderId: "",
  //     //     projectId: "fcm-push-notifi",
  //     //     storageBucket: "fcm-push-notifi.appspot.com")
  //     );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FilePickAndView(),
    );
  }
}
