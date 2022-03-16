class Exercise {
  final int? id;
  final String name;
  final Duration duration;
  final String imageUrl;
  final String audioUrl;
  final String description;

  Exercise({
    this.id,
    required this.name,
    required this.duration,
    required this.audioUrl,
    required this.imageUrl,
    required this.description
  });
}