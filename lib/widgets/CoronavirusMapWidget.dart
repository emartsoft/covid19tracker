import 'package:covid19tracker/components/loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../main.dart';

class CoronavirusMapWidget extends StatefulWidget {
  CoronavirusMapWidget({
    Key key,
  }) : super(key: key);

  @override
  _CoronavirusMapWidgetState createState() => _CoronavirusMapWidgetState();
}

class _CoronavirusMapWidgetState extends State<CoronavirusMapWidget> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    isLoading = true;
  }

  final Set gestureRecognizers = [
    Factory(() => EagerGestureRecognizer()),
  ].toSet();

  final url = Uri.dataFromString(
          '<html><body><iframe style="width:100%"; width="560" height="900" src="https://coronavirus.app/map?mode=infected&embed=true" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></body></html>',
          mimeType: 'text/html')
      .toString();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WebView(
          key: globalWebKey,
          initialUrl: url,
          onPageFinished: (_) {
            setState(() {
              isLoading = false;
            });
          },
          userAgent:
              "Mozilla/5.0 (Linux; <Android Version>; <Build Tag etc.>) AppleWebKit/<WebKit Rev> (KHTML, like Gecko) Chrome/<Chrome Rev> Mobile Safari/<WebKit Rev>",
          gestureRecognizers: gestureRecognizers,
          javascriptMode: JavascriptMode.unrestricted,
        ),
        isLoading ? Center( child: ColorLoader()) : Container(),
      ],
    );
  }
}
