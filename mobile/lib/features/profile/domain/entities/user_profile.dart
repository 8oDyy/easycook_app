class UserProfile {
  final String id;
  final String name;
  final String? avatarUrl;
  final String level;
  final int streakDays;
  final int xpPoints;
  final int favoritesCount;
  final String? lastRecipe;
  final int ingredientsCount;

  const UserProfile({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.level,
    required this.streakDays,
    required this.xpPoints,
    required this.favoritesCount,
    this.lastRecipe,
    required this.ingredientsCount,
  });
}
