import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const String name = 'home';
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
