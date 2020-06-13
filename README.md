
# Covid-19 Tracker Overview
The coronavirus disease 2019 (COVID-19) is an infectious disease caused by a type of coronavirus known as SARS-CoV-2 that had caused an ongoing pandemic. This app gives an overview of the cases and other related information.

# Screenshots

# API
This app uses following APIs:
1. Covid19 API - [Novel COVID API](https://corona.lmao.ninja/).
2. News API - [News API](https://newsapi.org/).

For News API, you need to [register for an API Key](https://newsapi.org/register).
Thereafter, add the API Key in this file [api_helper.dart](https://github.com/emartsoft/covid19tracker/blob/master/lib/api/api_helper.dart):

```dart
  import 'package:http/http.dart';

  class ApiHelper {
  ...
   final String newsApiKey = "";
  }
```

# Contributing
All contributors are welcome! 
Make your pull requests and they'll be considered.

# Getting Started
For help getting started with Flutter, view flutter [online documentation](https://flutter.io/).

# License
This project is licensed under the [MIT License](LICENSE).

