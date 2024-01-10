import 'package:flutter/material.dart';
import 'package:lisa_bot/screens/chat.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lisa AI',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/chat': (context) => const Chat(),
      },
    );
  }
}
