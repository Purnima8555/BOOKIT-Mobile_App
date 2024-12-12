import 'package:bookit_flutter_project/view/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:bookit_flutter_project/authorization/register_view.dart';
import 'package:bookit_flutter_project/authorization/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/login': (context) => LoginView(),
        '/register': (context) => RegisterView(),
      },
    );
  }
}
