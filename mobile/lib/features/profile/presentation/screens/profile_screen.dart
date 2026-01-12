import 'package:flutter/material.dart';

import '../widgets/profile_header_card.dart';
import '../widgets/streak_card.dart';
import '../widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Mon Profil',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            ProfileHeaderCard(
              name: 'Julie Dupont',
              level: 'Apprenti chef',
              avatarUrl: '',
              onEditTap: () {},
            ),
            const SizedBox(height: 16),
            StreakCard(
              streakDays: 3,
              xpPoints: 15,
              progress: 0.75,
            ),
            const SizedBox(height: 16),
            ProfileMenuItem(
              icon: Icons.favorite,
              iconColor: const Color(0xFFFF6B9D),
              title: 'Mes favoris',
              subtitle: '24 recettes sauvées',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.history,
              iconColor: const Color(0xFF4ECDC4),
              title: 'Historique',
              subtitle: 'Dernier plat: Curry de légumes',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.kitchen,
              iconColor: const Color(0xFF51CF66),
              title: 'Mes ingrédients',
              subtitle: '12 items dans le frigo',
              onTap: () {},
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Déconnexion',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Version 2.0.4',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

