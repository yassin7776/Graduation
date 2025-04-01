import "package:flutter/material.dart";
import 'package:flutter_application_1/screens/CalenderScreen.dart';
import 'package:flutter_application_1/screens/Labs.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/register.dart';
import 'package:flutter_application_1/screens/reset.dart';
import 'package:flutter_application_1/screens/verify.dart';
import 'package:flutter_application_1/screens/welcomeScreen.dart';
import 'package:flutter_application_1/screens/attendance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const WelcomeScreen(),
      routes: {
        'RegisterScreen': (context) => const RegisterScreen(),
        'LoginScreen': (context) => const LoginScreen(),
        'ResetPass': (context) => const ResetPass(),
        'VerifyScreen': (context) => const VerifyScreen(),
        'CalendarScreen': (context) => const CalendarScreen(),
        'Labs': (context) => const labs(),
        '/add_holiday': (context) => const SimplePage(title: "Add Holiday"),
        '/remove_holiday': (context) =>
            const SimplePage(title: "Remove Holiday"),
        '/upload_holiday': (context) =>
            const SimplePage(title: "Upload Holiday"),
        '/update_holiday': (context) =>
            const SimplePage(title: "Update Holiday"),
        '/show_labs': (context) => const SimplePage(title: "Show Labs"),
        'AttendanceScreen': (context) => AttendanceScreen(),
      },
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;

  const SimplePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
