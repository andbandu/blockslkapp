// services/tag_service.dart

import 'dart:convert';
import 'package:blockslk/models/tag.dart';
import 'package:http/http.dart' as http;

class TagService {
  static const String apiUrl =
      'https://www.blocks.lk/ghost/api/content/tags/?key=cd71ef2537c698385290b9b21c';

  Future<List<Tag>> getTags() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['tags'];
      return data.map((json) => Tag.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tags');
    }
  }
}
