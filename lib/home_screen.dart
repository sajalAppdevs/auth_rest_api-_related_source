import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.userEmail}) : super(key: key);

  final String userEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('user email : $userEmail'),
      ),
    );
  }
}
