import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'mike_screen.dart';
import 'you_screen.dart';
import 'budget_screen.dart';
import 'add_transaction_screen.dart';
import 'main.dart'; // for theme toggle access

class HomeShell extends StatefulWidget {
  final bool isAccountUser;

  const HomeShell({
    super.key,
    required this.isAccountUser,
  });

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int index = 0;

  final List<String> titles = [
    'Mike',
    'Budget',
    'Add Transaction',
    'You',
  ];

  late final List<Widget> screens = [
    const MikeScreen(),          // Mike ONLY here
    const BudgetScreen(),
    const AddTransactionScreen(),
    const YouScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF6F4E37);

    return Scaffold(
      appBar: AppBar(
  title: Text(titles[index]),

  leading: index == 0
      // HOME → menu
      ? Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        )
      // OTHER SCREENS → back arrow
      : IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              index = 0; // go back to Home (Mike)
            });
          },
        ),
),

      /// Drawer (exists always, but only accessible on Home)
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.primary,
  ),
  child: const Align(
    alignment: Alignment.bottomLeft,
    child: Text(
      'Settings',
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: MyApp.of(context).isDarkMode,
              onChanged: (value) {
                MyApp.of(context).toggleTheme(value);
              },
            ),

            ListTile(
              leading: const Icon(Icons.swap_horiz),
              title: const Text('Change Tier'),
              onTap: () {
                Navigator.pop(context);
                // later → navigate to tier selection
              },
            ),
          ],
        ),
      ),

      body: screens[index],

      bottomNavigationBar: Container(
        color: Colors.brown.shade100,
        padding: const EdgeInsets.all(12),
        child: GNav(
          selectedIndex: index,
          onTabChange: (i) => setState(() => index = i),
          backgroundColor: Colors.brown.shade100,
          color: Colors.brown,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.brown,
          gap: 8,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.pie_chart, text: 'Budget'),
            GButton(icon: Icons.add_circle, text: 'Add'),
            GButton(icon: Icons.person, text: 'You'),
          ],
        ),
      ),
    );
  }
}