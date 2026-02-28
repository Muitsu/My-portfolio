class ProjectModel {
  final String title;
  final String description;
  final String image;
  final List<String> tags;
  final int stars;

  ProjectModel({
    required this.title,
    required this.description,
    required this.image,
    required this.tags,
    required this.stars,
  });
}
