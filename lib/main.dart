import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lisa_bot/screens/chat.dart';
import 'package:lisa_bot/store/cubit/user.dart';
import 'screens/home.dart';
import 'screens/auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(BlocProvider(create: (context) => UserCubit(), child: const MyApp()));
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
        '/': (context) => const Auth(),
        '/home': (context) => const Home(),
        '/chat': (context) => const Chat(),
      },
    );
  }
}
