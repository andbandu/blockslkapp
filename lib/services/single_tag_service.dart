import 'dart:convert';
import 'package:http/http.dart' as http;

class SingleTagService {
  final String tagApiUrl;

  SingleTagService({required this.tagApiUrl});
  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(Uri.parse(tagApiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['posts'];
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
