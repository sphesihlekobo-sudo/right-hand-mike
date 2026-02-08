import 'package:flutter/material.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Budget plan for user',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}