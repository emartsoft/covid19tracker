import 'dart:convert';

AllCasesModel allCasesModelFromJson(String str) =>
    AllCasesModel.fromMap(json.decode(str));
String allCasesModelToJson(AllCasesModel data) => json.encode(data.toMap());

class AllCasesModel {
  int cases;
  int deaths;
  int recovered;
  int todayCases;
  int todayDeaths;
  DateTime updated;
  int active;
  int critical;
  int affectedCountries;
  double casesPerOneMillion;
  double deathsPerOneMillion;
  int tests;
  double testsPerOneMillion;

  AllCasesModel({
    this.cases,
    this.deaths,
    this.recovered,
    this.updated,
    this.active,
    this.affectedCountries,
    this.todayCases,
    this.todayDeaths,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
  });

  factory AllCasesModel.fromMap(Map<String, dynamic> json) => AllCasesModel(
        cases: json["cases"] == null ? null : json["cases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        updated: json["updated"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["updated"]),
        active: json["active"] == null ? null : json["active"],
        affectedCountries: json["affectedCountries"] == null
            ? null
            : json["affectedCountries"],
        todayDeaths: json["todayDeaths"] == null ? null : json["todayDeaths"],
        todayCases: json["todayCases"] == null ? null : json["todayCases"],
        critical: json["critical"] == null ? null : json["critical"],
        tests: json["tests"] == null ? null : json["tests"],
        casesPerOneMillion: json["casesPerOneMillion"] == null
            ? null
            : double.parse(json["casesPerOneMillion"].toString()),
        deathsPerOneMillion: json["deathsPerOneMillion"] == null
            ? null
            : double.parse(json["deathsPerOneMillion"].toString()),
        testsPerOneMillion: json["testsPerOneMillion"] == null
            ? null
            : double.parse(json["testsPerOneMillion"].toString()),
      );

  Map<String, dynamic> toMap() => {
        "cases": cases == null ? null : cases,
        "deaths": deaths == null ? null : deaths,
        "recovered": recovered == null ? null : recovered,
        "updated": updated == null ? null : updated.toIso8601String(),
        "active": active == null ? null : active,
        "affectedCountries":
            affectedCountries == null ? null : affectedCountries,
        "todayDeaths": todayDeaths == null ? null : todayDeaths,
        "todayCases": todayCases == null ? null : todayCases,
        "critical": critical == null ? null : critical,
        "tests": tests == null ? null : tests,
        "casesPerOneMillion":
            casesPerOneMillion == null ? null : casesPerOneMillion,
        "deathsPerOneMillion":
            deathsPerOneMillion == null ? null : deathsPerOneMillion,
        "testsPerOneMillion":
            testsPerOneMillion == null ? null : testsPerOneMillion,
      };
}
