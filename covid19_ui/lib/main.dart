import 'dart:async';

import 'package:covid19_ui/constants.dart';
import 'package:covid19_ui/info_screen.dart';
import 'package:covid19_ui/model/covid_case.dart';
import 'package:covid19_ui/widgets/couter.dart';
import 'package:covid19_ui/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 App UI',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          body1: TextStyle(
            color: kBodyTextColor,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final countryDropdown = [
    {'name': 'Thailand', 'value': 'Thailand'},
    {'name': 'Indonesia', 'value': 'indonesia'},
    {'name': 'Japanse', 'value': 'jp'},
    {'name': 'China', 'value': 'china'},
    {'name': 'Singapor', 'value': 'singapore'},
  ];
  var itemSelected = 0;
  final String urlApi = "https://disease.sh/v3/covid-19/countries/";
  late StreamController<CovidCase?> _caseNumberController;

  @override
  void initState() {
    super.initState();
    _caseNumberController = new StreamController<CovidCase?>();
    loadDataFromAPI(urlApi + countryDropdown.first['value'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyHeader(
            image: "doctor.png",
            textTop: "All you must is",
            textBottom: "stay at home.",
          ),
          //Dropdown Select
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: kBorderColor),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: kPrimaryColor,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: Icon(Icons.keyboard_arrow_down),
                    value: itemSelected,
                    items: countryDropdown
                        .map((val) => DropdownMenuItem(
                              child: Text(val["name"].toString()),
                              value: countryDropdown.indexOf(val),
                            ))
                        .toList(),
                    onChanged: (val) {
                      var index = int.parse(val.toString());

                      setState(() {
                        itemSelected = index;
                      });
                      loadDataFromAPI(
                          "$urlApi${countryDropdown[index]['value']}");
                    },
                  ),
                ),
              ],
            ),
          ),
          //Body
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Case Updates\n",
                            style: kTitleTextStyle,
                          ),
                          TextSpan(
                            text: "Newest update  ",
                            style: kSubTextStyle,
                          ),
                          TextSpan(
                            text: "Today",
                            style: kSubTextStyle.copyWith(
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoScreen(),
                        ),
                      ),
                      child: Text(
                        "See Details",
                        style: kSubTextStyle.copyWith(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 120,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: kShadowColor,
                      ),
                    ],
                  ),
                  child: StreamBuilder<CovidCase?>(
                    stream: _caseNumberController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.updated != 0) {
                          return buildCovidCaseNum(snapshot.data);
                        } else
                          return Center(child: Text("No data in API"));
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spread of Virus",
                      style: kTitleTextStyle,
                    ),
                    Text(
                      "See Details",
                      style: kSubTextStyle.copyWith(color: kPrimaryColor),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: kShadowColor,
                        blurRadius: 30,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/images/map.png",
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loadDataFromAPI(String url) async {
    _caseNumberController.add(null);
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      _caseNumberController.add(covidCaseFromJson(res.body));
    } else {
      _caseNumberController.add(covidCaseError());
    }
  }

  Widget buildCovidCaseNum(CovidCase? data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Couter(
          number: data!.todayCases,
          color: kInfectedColor,
          title: "Infected",
        ),
        Couter(
          number: data.todayDeaths,
          color: kDeathColor,
          title: "Deaths",
        ),
        Couter(
          number: data.todayRecovered,
          color: kRecoverColor,
          title: "Recovered",
        ),
      ],
    );
  }
}
