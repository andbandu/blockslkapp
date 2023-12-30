// models/tag.dart

class Tag {
  final String slug;
  final String id;
  final String name;
  final String? accentColor;
  final String url;

  Tag({
    required this.slug,
    required this.id,
    required this.name,
    this.accentColor,
    required this.url,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    String accentColorWithHash = json['accent_color'] ?? '';
    String accentColorWithoutHash = accentColorWithHash.replaceAll("#", "");
    return Tag(
      slug: json['slug'],
      id: json['id'],
      name: json['name'],
      accentColor: accentColorWithoutHash,
      url: json['url'],
    );
  }
}
