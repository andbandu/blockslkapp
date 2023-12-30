import 'package:blockslk/models/tag.dart';
import 'package:blockslk/postdetaipage.dart';
import 'package:blockslk/services/post_service.dart';
import 'package:blockslk/services/tag_service.dart';
import 'package:blockslk/widgets/app_bar.dart';
import 'package:blockslk/widgets/blog_post_card.dart';
import 'package:blockslk/widgets/tag_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:blockslk/config.dart';

import 'models/blog_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService(
    apiUrl:
        'https://www.blocks.lk/ghost/api/content/posts/?key=${AppConfig.apiKey}&include=tags,authors',
  );

  final TagService tagService = TagService();
  late Future<List<Tag>> tags;

  @override
  void initState() {
    super.initState();
    tags = tagService.getTags();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppBar(),
        backgroundColor: const Color(0xFFf8f9fa),
        body: Column(
          children: [
            SizedBox(
              height: 68.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder<List<Tag>>(
                  future: tags,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return tagList(snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    // By default, show a loading spinner
                    return const SpinKitThreeBounce(
                      color: Colors.black, // Adjust the color as needed
                      size: 16.0, // Adjust the size as needed
                    );
                  },
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
        ));
  }
}
