import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/views/taskView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) => runApp( MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(239, 253, 226, 253),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(253, 119, 2, 115),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: TaskView(),
    );
  }
}
