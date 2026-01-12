import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/inspiration_card.dart';
import '../widgets/continue_recipe_card.dart';
import '../widgets/recipe_card.dart';
import '../widgets/quick_recipe_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: const Color(0xFFF8F9FA),
              elevation: 0,
              title: Row(
                children: [
                  const Text(
                    'Stitch',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    '- Design with AI',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.orange[400],
                    size: 20,
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined, color: Colors.black87),
                  onPressed: () {},
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  InspirationCard(
                    onGenerateRecipe: () => context.push('/ai-generate'),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionHeader(
                    title: 'Reprendre',
                    actionText: 'En cours',
                    actionColor: const Color(0xFFFF6B6B),
                  ),
                  const SizedBox(height: 8),
                  ContinueRecipeCard(
                    imageUrl: '',
                    title: 'Pâtes au Pesto Vert',
                    subtitle: 'Étape 3 sur 5',
                    progress: 0.6,
                    onTap: () {},
                  ),
                  const SizedBox(height: 24),
                  _buildSectionHeader(
                    title: 'Pour toi',
                    actionIcon: Icons.arrow_forward,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 260,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        RecipeCard(
                          imageUrl: '',
                          title: 'Bowl Saumon',
                          difficulty: 'Facile',
                          calories: 480,
                          cookingTimeMinutes: 20,
                          tags: const ['Rapide'],
                          onTap: () {},
                        ),
                        RecipeCard(
                          imageUrl: '',
                          title: 'Pizza Maison',
                          difficulty: 'Moyen',
                          calories: 650,
                          cookingTimeMinutes: 35,
                          tags: const ['Végé'],
                          onTap: () {},
                        ),
                        RecipeCard(
                          imageUrl: '',
                          title: 'Salade César',
                          difficulty: 'Facile',
                          calories: 320,
                          cookingTimeMinutes: 15,
                          tags: const ['Rapide'],
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionHeader(
                    title: 'Rapide ce soir',
                    actionIcon: Icons.arrow_forward,
                  ),
                  const SizedBox(height: 8),
                  QuickRecipeItem(
                    imageUrl: '',
                    title: 'Salade César Express',
                    description: 'Poulet grillé, parmesan...',
                    onTap: () {},
                    onAddTap: () {},
                  ),
                  QuickRecipeItem(
                    imageUrl: '',
                    title: 'Boulettes Tomate',
                    description: 'Sauce maison en 10...',
                    onTap: () {},
                    onAddTap: () {},
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    String? actionText,
    IconData? actionIcon,
    Color? actionColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          if (actionText != null)
            Text(
              actionText,
              style: TextStyle(
                fontSize: 14,
                color: actionColor ?? const Color(0xFF4ECDC4),
                fontWeight: FontWeight.w600,
              ),
            )
          else if (actionIcon != null)
            Icon(
              actionIcon,
              color: Colors.grey[400],
              size: 24,
            ),
        ],
      ),
    );
  }
}
