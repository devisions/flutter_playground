import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class ApiService {
  final String _baseUrl = 'api.nytimes.com';
  final String apiKey;

  ApiService(this.apiKey);

  Future<List<Article>> fetchArticlesBySection(String sectionName) async {
    //
    print("trc>>> ApiService > Fetching using api-key:$apiKey");
    Map<String, String> params = {'api-key': apiKey};
    Uri uri = Uri.https(_baseUrl, '/svc/topstories/v2/$sectionName.json', params);
    try {
      var response = await http.get(uri);
      Map<String, dynamic> data = json.decode(response.body);
      List<Article> articles = [];
      data['results'].forEach(
        (articleMap) => articles.add(Article.fromMap(articleMap)),
      );
      print('>>> Processed ${articles.length} articles.');
      return articles;
    } catch (err) {
      throw err.toString();
    }
  }
}
