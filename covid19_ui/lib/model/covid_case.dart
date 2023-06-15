import 'dart:convert';

CovidCase covidCaseFromJson(String str) => CovidCase.fromJson(json.decode(str));

String covidCaseToJson(CovidCase data) => json.encode(data.toJson());

CovidCase covidCaseError() => CovidCase();

class CovidCase {
  CovidCase({
    this.updated = 0,
    this.todayCases = 0,
    this.todayDeaths = 0,
    this.todayRecovered = 0,
  });

  int updated;
  int todayCases;
  int todayDeaths;
  int todayRecovered;

  factory CovidCase.fromJson(Map<String, dynamic> json) => CovidCase(
        updated: json["updated"],
        todayCases: json["todayCases"],
        todayDeaths: json["todayDeaths"],
        todayRecovered: json["todayRecovered"],
      );

  Map<String, dynamic> toJson() => {
        "updated": updated,
        "todayCases": todayCases,
        "todayDeaths": todayDeaths,
        "todayRecovered": todayRecovered,
      };
}
