import 'dart:convert';

import 'package:fake_news_app_api/models/news_model.dart';
import 'package:http/http.dart';

class ApiService {
  final all_news_url =
      "https://newsapi.org/v2/everything?q=*&apiKey=4ebc144ba1d845e192540df6bd2526cd";

  final breaking_news_url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=4ebc144ba1d845e192540df6bd2526cd";

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(all_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articles =
            body.map((dynamic item) => NewsModel.fromJson(item)).toList();
        return articles;
      } else {
        throw ("No artile found");
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
