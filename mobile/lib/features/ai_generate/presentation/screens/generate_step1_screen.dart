import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/selection_card.dart';

enum GenerationMode {
  fromIngredients,
  fromDish,
}

class GenerateStep1Screen extends StatefulWidget {
  const GenerateStep1Screen({super.key});

  @override
  State<GenerateStep1Screen> createState() => _GenerateStep1ScreenState();
}

class _GenerateStep1ScreenState extends State<GenerateStep1Screen> {
  GenerationMode _selectedMode = GenerationMode.fromIngredients;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'ÉTAPE 1/4',
          style: TextStyle(
            color: Color(0xFFEF4444),
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Générer\n',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              height: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: 'une recette',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFEF4444),
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Choisis ton point de départ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SelectionCard(
                    imageUrl: '',
                    icon: Icons.kitchen_outlined,
                    title: 'À partir d\'ingrédients',
                    subtitle: 'Tu as déjà des ingrédients',
                    isSelected: _selectedMode == GenerationMode.fromIngredients,
                    onTap: () {
                      setState(() {
                        _selectedMode = GenerationMode.fromIngredients;
                      });
                    },
                  ),
                  SelectionCard(
                    imageUrl: '',
                    icon: Icons.restaurant_outlined,
                    title: 'À partir d\'un plat / envie',
                    subtitle: 'Tu sais ce que tu veux manger',
                    isSelected: _selectedMode == GenerationMode.fromDish,
                    onTap: () {
                      setState(() {
                        _selectedMode = GenerationMode.fromDish;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEF4444),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Continuer',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      'Annuler',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
