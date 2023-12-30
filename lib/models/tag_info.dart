class TagInfo {
  final String name;
  final String accentColor;

  TagInfo({
    required this.name,
    required this.accentColor,
  });

  factory TagInfo.fromJson(Map<String, dynamic> json) {
    String accentColorWithHash = json['accent_color'] ?? '';
    String accentColorWithoutHash = accentColorWithHash.replaceAll("#", "");
    return TagInfo(
      name: json['name'] ?? '',
      accentColor: accentColorWithoutHash,
    );
  }
}
