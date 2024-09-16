import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  bool isLoggedIn = false;

  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          setState(
            () {
              isLoggedIn = user != null;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: !isLoggedIn ? Signup() : HomePage(),
    );
  }
}
