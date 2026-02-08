import 'package:flutter/material.dart';

class MikeScreen extends StatelessWidget {
  const MikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'These are Mike thoughts',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}