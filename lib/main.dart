import 'package:flutter/material.dart';
import 'package:pharmaco/Pages/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharmaco/Pages/auth_page.dart';
import 'package:pharmaco/Pages/login.dart';
import 'package:pharmaco/Pages/splash_screen.dart';
import 'package:pharmaco/test.dart';
import 'firebase_options.dart';
// import 'login.dart';
import 'package:pharmaco/Pages/Dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}
