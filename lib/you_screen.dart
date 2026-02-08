import 'package:flutter/material.dart';

class YouScreen extends StatelessWidget {
  const YouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'User information will display here',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}