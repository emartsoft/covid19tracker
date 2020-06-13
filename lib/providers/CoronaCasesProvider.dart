import 'package:covid19tracker/api/api_helper.dart';
import 'package:covid19tracker/models/CoronaCases.dart';
import 'package:flutter/material.dart';

class CoronaCasesProvider with ChangeNotifier {
  var api = ApiHelper();
  List<CoronaCases> cases=[];

  Future<List<CoronaCases>> getCoronaCases() async {
    String url = "${api.baseUrlMain}/countries?sort=cases";
    final response = await api.httpclient.get(url);
    if (response.statusCode == 200) {
      notifyListeners();
      var res = coronaCasesModelFromJson(response.body);
      cases = res;
      return cases;
    } else {
      return null;
    }
  }
}


class TopCases {
  String country;
  int cases;
  String iso2;

  TopCases({this.country, this.cases, this.iso2});
}

class TopCasesProvider with ChangeNotifier {
  var api = ApiHelper();
  List<CoronaCases> cases=[];
  List<TopCases> tops = [];

  Future<List<TopCases>> getCoronaCases() async {
    String url = "${api.baseUrlMain}/countries?sort=cases";
    final response = await api.httpclient.get(url);
    if (response.statusCode == 200) {
      notifyListeners();
      var res = coronaCasesModelFromJson(response.body);
      cases = res;

      for (var i = 0; i < 3; i++) {
        TopCases caset = new TopCases();
        caset.country = cases[i].country;
        caset.cases = cases[i].cases;
        caset.iso2 = cases[i].countryInfo.iso2;
        tops.add(caset);
      }

      return tops;
    } else {
      return null;
    }
  }
}