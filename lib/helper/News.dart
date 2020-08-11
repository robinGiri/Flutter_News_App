import 'dart:convert';
import 'package:newsapp/model/Articles_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticlesModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=e5948c4ecd764996b78aef5bb23c3a83";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        ArticlesModel articlesModel = ArticlesModel(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element['content'],
        );
        news.add(articlesModel);
      });
    }
  }
}
