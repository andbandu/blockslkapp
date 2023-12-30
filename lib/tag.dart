import 'package:blockslk/config.dart';
import 'package:blockslk/models/blog_post.dart';
import 'package:blockslk/models/tag.dart';
import 'package:blockslk/postdetaipage.dart';
import 'package:blockslk/services/single_tag_service.dart';
import 'package:blockslk/widgets/appbar_inside.dart';
import 'package:blockslk/widgets/blog_post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TagPage extends StatefulWidget {
  final Tag tag;
  const TagPage({super.key, required this.tag});

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  late SingleTagService apiService;
  @override
  void initState() {
    super.initState();
    apiService = SingleTagService(
      tagApiUrl:
          'https://www.blocks.lk/ghost/api/content/posts/?key=${AppConfig.apiKey}&include=tags,authors&formats=plaintext&filter=tag:${widget.tag.slug}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarInside(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.tag.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: apiService.fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitCubeGrid(
                      color: Colors.black, // Adjust the color as needed
                      size: 40.0, // Adjust the size as needed
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  final List<Post> posts = snapshot.data!
                      .map((data) => Post.fromJson(data))
                      .toList();
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to a new page when a post card is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PostDetailPage(post: posts[index]),
                            ),
                          );
                        },
                        child: PostCard(post: posts[index]),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> buildPopupMenuItem(String title, String url) {
    return PopupMenuItem(
      value: url,
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }
}
