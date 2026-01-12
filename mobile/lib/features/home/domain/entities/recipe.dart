class Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final int cookingTimeMinutes;
  final int calories;
  final String difficulty;
  final List<String> tags;
  final String? description;
  final double? progress;

  const Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.cookingTimeMinutes,
    required this.calories,
    required this.difficulty,
    required this.tags,
    this.description,
    this.progress,
  });
}
