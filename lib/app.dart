import 'package:flutter/material.dart';
import 'package:bookit_flutter_project/core/theme/app_theme.dart';
import 'package:bookit_flutter_project/view/on_boarding_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Assignment',
      home: OnboardingScreen(),
      theme: getApplicationTheme(),
    );
  }
}
