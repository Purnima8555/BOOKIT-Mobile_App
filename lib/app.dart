import 'package:bookit_flutter_project/view/dashboardView.dart';
import 'package:bookit_flutter_project/view/loginView.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:DashboardView(),
    );
  }
}
