import 'package:blockslk/models/blog_post.dart';
import 'package:blockslk/widgets/card_excerpt.dart';
import 'package:blockslk/widgets/card_meta.dart';
import 'package:blockslk/widgets/card_title.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      color: const Color(0xFFffffff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    post.featureImage,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.tagInfo.name,
                  style: TextStyle(
                    color: Color(int.parse('0xFF${post.tagInfo.accentColor}')),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                cardTitle(post.title),
                const SizedBox(height: 8),
                CardExcerpt(excerpt: post.excerpt),
                const SizedBox(height: 8),
                CardMeta(
                    authorName: post.primaryAuthorName,
                    publishDate: post.publishDate),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
