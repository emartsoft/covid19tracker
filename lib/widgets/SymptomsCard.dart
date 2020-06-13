import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SymptomsCard extends StatelessWidget {
  final int index;
  final String imageUrl;
  final String symptoms;
  final String desc;
  final String url;
  SymptomsCard({
    this.index,
    this.imageUrl,
    this.symptoms,
    this.desc,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle cardTitleStyle =
        Theme.of(context).textTheme.headline6.copyWith(fontSize: 24.0);
    TextStyle cardSubtitleStyle = Theme.of(context)
        .textTheme
        .headline6
        .copyWith(fontSize: 15.0, color: Colors.grey);
    TextStyle cardButtonStyle = Theme.of(context)
        .textTheme
        .headline6
        .copyWith(fontSize: 16.0, color: Colors.white);
    return SingleChildScrollView(
          child: Card(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(children: [
            Image.asset(
              "assets/symptoms/$imageUrl",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                symptoms,
                style: cardTitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                desc,
                style: cardSubtitleStyle,
              ),
            ),
            RaisedButton(
              elevation: 2.0,
              color: Colors.blue,
              child: Text(
                "READ MORE",
                style: cardButtonStyle,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(
                  30.0,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SafeArea(
                      child: InAppWebView(
                        initialUrl: url,
                        initialOptions: InAppWebViewWidgetOptions(
                          inAppWebViewOptions: InAppWebViewOptions(
                            debuggingEnabled: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
