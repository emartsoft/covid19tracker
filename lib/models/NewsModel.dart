import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class News extends Object with _$NewsSerializerMixin {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final Source source;

  News(this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.source);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}

@JsonSerializable()
class Source extends Object with _$SourceSerializerMixin {
  final String id;
  final String name;

  Source(this.id, this.name);

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

@JsonSerializable()
class NewsList extends Object with _$NewsListSerializerMixin {

  final String status;
  final int totalResults;
  final List<News> articles;
  final code;
  final message;

  NewsList(this.status, this.totalResults, this.articles, this.code, this.message);

  factory NewsList.fromJson(Map<String, dynamic> json) => _$NewsListFromJson(json);

}

News _$NewsFromJson(Map<String, dynamic> json) => new News(
    json['author'] as String,
    json['title'] as String,
    json['description'] as String,
    json['url'] as String,
    json['urlToImage'] as String,
    json['publishedAt'] as String,
    json['source'] == null
        ? null
        : new Source.fromJson(json['source'] as Map<String, dynamic>));

abstract class _$NewsSerializerMixin {
  String get author;
  String get title;
  String get description;
  String get url;
  String get urlToImage;
  String get publishedAt;
  Source get source;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'source': source
      };
}

Source _$SourceFromJson(Map<String, dynamic> json) =>
    new Source(json['id'] as String, json['name'] as String);

abstract class _$SourceSerializerMixin {
  String get id;
  String get name;
  Map<String, dynamic> toJson() => <String, dynamic>{'id': id, 'name': name};
}

NewsList _$NewsListFromJson(Map<String, dynamic> json) => new NewsList(
    json['status'] as String,
    json['totalResults'] as int,
    (json['articles'] as List)
        ?.map((e) =>
            e == null ? null : new News.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['code'],
    json['message']);

abstract class _$NewsListSerializerMixin {
  String get status;
  int get totalResults;
  List<News> get articles;
  dynamic get code;
  dynamic get message;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'totalResults': totalResults,
        'articles': articles,
        'code': code,
        'message': message
      };
}