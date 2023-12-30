import 'package:blockslk/models/tag_info.dart';

class Post {
  final String title;
  final String excerpt;
  final String featureImage;
  final String content;
  final TagInfo tagInfo;
  final String primaryAuthorName;
  final DateTime publishDate;
  final String url;

  Post(
      {required this.title,
      required this.excerpt,
      required this.featureImage,
      required this.content,
      required this.tagInfo,
      required this.primaryAuthorName,
      required this.publishDate,
      required this.url});

  factory Post.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> primaryTag = json['primary_tag'] ?? {};
    final Map<String, dynamic> primaryAuthor = json['primary_author'] ?? {};
    return Post(
      title: json['title'],
      excerpt: json['excerpt'] ?? '',
      featureImage: json['feature_image'] ?? '',
      content: json['html'] ?? '',
      tagInfo: TagInfo.fromJson(primaryTag),
      primaryAuthorName: primaryAuthor['name'] ?? '',
      publishDate: DateTime.parse(json['published_at'] ?? ''),
      url: json['url'] ?? '',
    );
  }
}
