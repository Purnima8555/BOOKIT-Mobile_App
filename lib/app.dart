// import 'package:bookit_flutter_project/view/dashboard_view.dart';
import 'package:bookit_flutter_project/authorization/login_view.dart';
import 'package:bookit_flutter_project/authorization/register_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterView(),
    );
  }
}
