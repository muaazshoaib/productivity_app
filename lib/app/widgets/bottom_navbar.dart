import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../modules/analytics/screens/analytics_screen.dart';
import '../modules/home_screen.dart';
import '../modules/settings/screens/settings_screen.dart';

class CurvedBottomBar extends StatelessWidget {
  const CurvedBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 50,
      color: Colors.black,
      backgroundColor: Colors.grey.shade300,
      animationDuration: const Duration(milliseconds: 300),
      items: [
        Icon(Icons.analytics_sharp, color: Colors.grey.shade300),
        Icon(
          Icons.home,
          color: Colors.grey.shade300,
        ),
        Icon(Icons.settings, color: Colors.grey.shade300)
      ],
      onTap: (index) {
        if (index == 0) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AnalyticsScreen()));
          });
        } else if (index == 1) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          });
        } else if (index == 2) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsScreen()));
          });
        }
      },
    );
  }
}
