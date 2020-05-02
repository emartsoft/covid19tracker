import 'package:covid19tracker/api/api_helper.dart';
import 'package:covid19tracker/models/CoronaCases.dart';
import 'package:flutter/material.dart';

class CoronaCasesProvider with ChangeNotifier {
  var api = ApiHelper();
  List<CoronaCases> cases;

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