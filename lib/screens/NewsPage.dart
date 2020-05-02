import 'dart:async';

import 'package:covid19tracker/components/loader.dart';
import 'package:covid19tracker/models/NewsModel.dart';
import 'package:covid19tracker/providers/NewsProvider.dart';
import 'package:covid19tracker/widgets/LoadingFooter.dart';
import 'package:covid19tracker/widgets/NewsItem.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  static const int IDLE = 0;
  static const int LOADING = 1;
  static const int ERROR = 3;
  static const int EMPTY = 4;

  int _pageCount = 0;

  int _status = IDLE;
  String _message;

  int _footerStatus = LoadingFooter.IDLE;
  double _lastOffset = 0.0;

  List<News> _articles;

  Completer<Null> _completer;
  ScrollController _controller;

  //final flutterWebviewPlugin = new FlutterWebviewPlugin();

  Future _getNews() async {
    _pageCount = 0;
    NewsList news = await NewsProvider().getHeadLines(page: _pageCount);
    if (!mounted) {
      return;
    }
    _articles = news?.articles;
    if (_completer != null) {
      _completer.complete();
      _completer = null;
    }
    setState(() {
      if ("ok".compareTo(news?.status) != 0) {
        _status = ERROR;
        _message = news?.message;
      } else if (_articles?.isEmpty ?? false) {
        _status = EMPTY;
      } else {
        _pageCount++;
        _status = IDLE;
      }
    });
  }

  Future<Null> _onRefresh() {
    _completer = new Completer<Null>();
    _getNews();
    return _completer.future;
  }

  Future loadMore() async {
    setState(() {
      _footerStatus = LoadingFooter.LOADING;
    });
    NewsList news = await NewsProvider().getHeadLines(page: _pageCount);
    if (!mounted) {
      return;
    }
    setState(() {
      if (news?.articles?.isNotEmpty ?? false) {
        _pageCount++;
      }
      _articles.addAll(news?.articles);
      _footerStatus = LoadingFooter.IDLE;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _status = LOADING;
    _controller = ScrollController();
    _controller.addListener(() {
      if (_footerStatus == LoadingFooter.IDLE &&
          _controller.offset > _lastOffset &&
          _controller.position.maxScrollExtent - _controller.offset < 100) {
        loadMore();
      }
      _lastOffset = _controller.offset;
    });
    _getNews();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    switch (_status) {
      case IDLE:
        return Scaffold(
          appBar: AppBar(
            title: Text('Covid-19 News'),
          ),
          body: SafeArea(
                      child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                  itemCount: _articles.length + 1,
                  itemBuilder: (context, index) {
                    if (index == _articles.length) {
                      return LoadingFooter(
                          retry: () {
                            loadMore();
                          },
                          state: _footerStatus);
                    } else {
                      return Card(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NewsItem(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SafeArea(
                                      child: WebView(
                                        initialUrl: '${_articles[index].url}',
                                      ),
                                    ),
                                  ),
                                );
                              },
                              news: _articles[index]),
                        ),
                      );
                    }
                  },
                  controller: _controller),
            ),
          ),
        );
      case LOADING:
        return Center(
          child: ColorLoader(),
        );
      case ERROR:
        return Center(
          child: Text(_message ?? "Something is wrong, Try again."),
        );
      case EMPTY:
        return Center(
          child: Text("No more Covid-19 News!"),
        );
      default:
        return Center(
          child: Text("..."),
        );
    }
  }
}
