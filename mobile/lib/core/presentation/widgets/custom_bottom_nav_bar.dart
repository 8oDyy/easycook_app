import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF4ECDC4);
    const inactiveColor = Color(0xFFBDBDBD);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home,
                label: 'Accueil',
                index: 0,
                isActive: currentIndex == 0,
                activeColor: primaryColor,
                inactiveColor: inactiveColor,
              ),
              _buildNavItem(
                icon: Icons.explore_outlined,
                label: 'Découvrir',
                index: 1,
                isActive: currentIndex == 1,
                activeColor: primaryColor,
                inactiveColor: inactiveColor,
              ),
              _buildCenterAIButton(
                isActive: currentIndex == 2,
                primaryColor: primaryColor,
              ),
              _buildNavItem(
                icon: Icons.favorite_border,
                label: 'Favoris',
                index: 3,
                isActive: currentIndex == 3,
                activeColor: primaryColor,
                inactiveColor: inactiveColor,
              ),
              _buildNavItem(
                icon: Icons.person_outline,
                label: 'Profil',
                index: 4,
                isActive: currentIndex == 4,
                activeColor: primaryColor,
                inactiveColor: inactiveColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isActive,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? activeColor : inactiveColor,
              size: 28,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? activeColor : inactiveColor,
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterAIButton({
    required bool isActive,
    required Color primaryColor,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: const Offset(0, -40),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
