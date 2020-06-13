import 'dart:convert';

List<CoronaCases> coronaCasesModelFromJson(String str) =>
    List<CoronaCases>.from(json.decode(str).map((x) => CoronaCases.fromMap(x)));
String coronaCasesModelToJson(List<CoronaCases> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CoronaCases {
  String country;
  CountryInfo countryInfo;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  double casesPerOneMillion;
  double deathsPerOneMillion;
  DateTime updated;
  double tests;
  double testsPerOneMillion;
  double population;
  String continent;

  CoronaCases({
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.updated,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
  });

  factory CoronaCases.fromMap(Map<String, dynamic> json) => CoronaCases(
        country: json["country"] == null ? null : json["country"],
        countryInfo: json["countryInfo"] == null
            ? null
            : CountryInfo.fromMap(json["countryInfo"]),
        cases: json["cases"] == null ? null : json["cases"],
        todayCases: json["todayCases"] == null ? null : json["todayCases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        todayDeaths: json["todayDeaths"] == null ? null : json["todayDeaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        active: json["active"] == null ? null : json["active"],
        critical: json["critical"] == null ? null : json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"] == null
            ? null
            : double.parse(json["casesPerOneMillion"].toString()),
        deathsPerOneMillion: json["deathsPerOneMillion"] == null
            ? null
            : double.parse(json["deathsPerOneMillion"].toString()),
        updated: json["updated"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["updated"]),
        tests:
            json["tests"] == null ? null : double.parse(json["tests"].toString()),
        testsPerOneMillion: json["testsPerOneMillion"] == null
            ? null
            : double.parse(json["testsPerOneMillion"].toString()),
        population: json["population"] == null
            ? null
            : double.parse(json["population"].toString()),
        continent: json["continent"] == null ? null : json["continent"],
      );

  Map<String, dynamic> toMap() => {
        "country": country == null ? null : country,
        "countryInfo": countryInfo == null ? null : countryInfo.toMap(),
        "cases": cases == null ? null : cases,
        "todayCases": todayCases == null ? null : todayCases,
        "deaths": deaths == null ? null : deaths,
        "todayDeaths": todayDeaths == null ? null : todayDeaths,
        "recovered": recovered == null ? null : recovered,
        "active": active == null ? null : active,
        "critical": critical == null ? null : critical,
        "casesPerOneMillion":
            casesPerOneMillion == null ? null : casesPerOneMillion,
        "deathsPerOneMillion":
            deathsPerOneMillion == null ? null : deathsPerOneMillion,
        "updated": updated == null ? null : updated,
        "tests": tests == null ? null : tests,
        "testsPerOneMillion":
            testsPerOneMillion == null ? null : testsPerOneMillion,
        "population":
            population == null ? null : population,
        "continent":
            continent == null ? null : continent,
      };
}

class CountryInfo {
  int id;
  double lat;
  double long;
  String flag;
  String iso3;
  String iso2;

  CountryInfo({
    this.id,
    this.lat,
    this.long,
    this.flag,
    this.iso3,
    this.iso2,
  });

  factory CountryInfo.fromMap(Map<String, dynamic> json) => CountryInfo(
        id: json["id"] == null ? null : json["id"],
        lat: json["lat"] == null ? null : double.parse(json["lat"].toString()),
        long:
            json["long"] == null ? null : double.parse(json["long"].toString()),
        flag: json["flag"] == null ? null : json["flag"],
        iso3: json["iso3"] == null ? null : json["iso3"],
        iso2: json["iso2"] == null ? null : json["iso2"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
        "flag": flag == null ? null : flag,
        "iso3": iso3 == null ? null : iso3,
        "iso2": iso2 == null ? null : iso2,
      };
}
