
# Covid-19 Tracker Overview
The coronavirus disease 2019 (COVID-19) is an infectious disease caused by a type of coronavirus known as SARS-CoV-2 that had caused an ongoing pandemic. This app gives an overview of the cases and other related information.

# Screenshots

<img src="https://github.com/emartsoft/covid19tracker/blob/master/screenshot/homepage.png" alt="Home" width="250">
<img src="https://github.com/emartsoft/covid19tracker/blob/master/screenshot/caselist.png" alt="CaseList" width="250">
<img src="https://github.com/emartsoft/covid19tracker/blob/master/screenshot/casemap.png" alt="CaseMap" width="250">
<img src="https://github.com/emartsoft/covid19tracker/blob/master/screenshot/news.png" alt="News" width="250">
<img src="https://github.com/emartsoft/covid19tracker/blob/master/screenshot/prevention.png" alt="Prevention" width="250">
<img src="https://github.com/emartsoft/covid19tracker/blob/master/screenshot/symptoms.png" alt="Symptoms" width="250">

# Building from Source

This app uses Dart2 which means that you should enable that in your IDE if you haven't done so yet.
1. [Setup Flutter](https://flutter.dev/docs/get-started/install) if not yet installed.

2. Clone/download the repository from github.

```sh
$ git clone https://github.com/emartsoft/covid19tracker.git
$ cd covid19tracker/
```

If using Android Studio:
Click Get dependencies to install the packages.

If using Visual Studio Code run this command:
```sh
flutter packages get
```
or
```sh
pub get
```

# API
This app uses following APIs:
1. Covid19 API - [Novel COVID API](https://corona.lmao.ninja/).
2. News API - [News API](https://newsapi.org/).

For News API, you need to [register for an API Key](https://newsapi.org/register).
Thereafter, Set this key to the constant **newsApiKey** in this file [api_helper.dart](https://github.com/emartsoft/covid19tracker/blob/master/lib/api/api_helper.dart):

```dart
  import 'package:http/http.dart';

  class ApiHelper {
  ...
   final String newsApiKey = "";
  }
```

# Demo
[Download the release APK to try out Covid19Tracker](https://github.com/emartsoft/covid19tracker/blob/master/release/Covid19Tracker.apk).

The apk may be behind master. Take a look at the changelog to see the most recent additions to the apk.

# Contributing
All contributors are welcome! 
Make your pull requests and they'll be considered.

# Getting Started
For help getting started with Flutter, view flutter [online documentation](https://flutter.io/).

# License
This project is licensed under the [MIT License](LICENSE).

