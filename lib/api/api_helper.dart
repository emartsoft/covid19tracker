import 'package:http/http.dart';

class ApiHelper {
  Client httpclient = Client();
  final String baseUrl = "https://covid19.mathdro.id";
  final String baseUrlMain = "https://corona.lmao.ninja/v2";
  final String baseUrlHistory = "https://corona.lmao.ninja/v2/historical";
  final String newsUrlMain = "https://newsapi.org/v2";
  final String newsApiKey = "dbf1e44ff1e04221b4bd0fffbe0e194c";
}
