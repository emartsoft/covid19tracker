import 'package:covid19tracker/api/api_helper.dart';
import 'package:covid19tracker/models/NewsModel.dart';
import 'dart:async';
import 'dart:convert';

class NewsProvider {
  var api = ApiHelper();

  Future<NewsList> getHeadLines({int page: 0}) async {
    //{String category: "general", int page: 0}
    // print("request $category - $page");
    final response = await api.httpclient.get(
        "${api.newsUrlMain}/top-headlines?q=COVID&sortBy=publishedAt&apiKey=${api.newsApiKey}&pageSize=10&language=en&page=$page");

    if (response.statusCode == 200) {
      return parseResult(response.body);
    } else {
      return null;
    }
  }

  NewsList parseResult(String respond) {
    return NewsList.fromJson(json.decode(respond));
  }
}
