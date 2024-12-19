import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page'),
    );
  }
}
