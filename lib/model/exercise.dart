class Exercise {
  final int? id;
  final String name;
  final Duration duration;
  final String imageUrl;
  final String description;

  Exercise({
    this.id,
    required this.name,
    required this.duration,
    required this.imageUrl,
    required this.description
  });
}