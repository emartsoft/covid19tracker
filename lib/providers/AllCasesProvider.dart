import 'package:covid19tracker/api/api_helper.dart';
import 'package:covid19tracker/models/AllCasesModel.dart';
import 'package:flutter/material.dart';

class AllCasesProvider with ChangeNotifier {
  var api = ApiHelper();
  AllCasesModel allCases;

  Future<AllCasesModel> getAllCasesProvider() async {
    // print(api.baseUrl);
    String url = "${api.baseUrlMain}/all";
    final response = await api.httpclient.get(url);
    if (response.statusCode == 200) {
      notifyListeners();
      var res = allCasesModelFromJson(response.body);
      allCases = res;
      return allCases;
    } else {
      return null;
    }
  }
}
