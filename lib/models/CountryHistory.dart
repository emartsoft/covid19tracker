import 'dart:convert';

CountryHistory countryHistoryFromJson(String str) => CountryHistory.fromMap(json.decode(str));
String countryHistoryToJson(CountryHistory data) => json.encode(data.toMap());


class CountryHistory {
  String country;
  Timeline timeline;

  CountryHistory({
    this.country,
    this.timeline,
  });

  factory CountryHistory.fromMap(Map<String, dynamic> json) => CountryHistory(
        country: json["country"] == null ? null : json["country"],
        timeline: json["timeline"] == null
            ? null
            : Timeline.fromMap(json["timeline"]),
      );

  Map<String, dynamic> toMap() => {
        "country": country == null ? null : country,
        "timeline": timeline == null ? null : timeline.toMap(),
      };
}

class Timeline {
  Map<String, int> cases;
  Map<String, int> deaths;
  Map<String, int> recovered;

  Timeline({
    this.cases,
    this.deaths,
    this.recovered,
  });

  factory Timeline.fromMap(Map<String, dynamic> json) => Timeline(
        cases: json["cases"] == null ? null : json["cases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
      );

  Map<String, dynamic> toMap() => {
        "cases": cases == null ? null : cases,
        "deaths": deaths == null ? null : deaths,
        "recovered": recovered == null ? null : recovered,
      };
}
