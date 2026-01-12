import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_bottom_nav_bar.dart';

class MainShellScreen extends StatelessWidget {
  final Widget child;
  final int currentIndex;

  const MainShellScreen({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  void _onNavTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/discover');
        break;
      case 2:
        context.push('/ai-generate');
        break;
      case 3:
        context.go('/favorites');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) => _onNavTap(context, index),
      ),
    );
  }
}
