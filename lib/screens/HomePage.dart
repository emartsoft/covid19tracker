import 'package:covid19tracker/components/NeumorphicCard.dart';
import 'package:covid19tracker/components/loader.dart';
import 'package:covid19tracker/constants/constants.dart';
import 'package:covid19tracker/models/AllCasesModel.dart';
import 'package:covid19tracker/models/CoronaCases.dart';
import 'package:covid19tracker/providers/AllCasesProvider.dart';
import 'package:covid19tracker/providers/CoronaCasesProvider.dart';
import 'package:covid19tracker/screens/AboutPage.dart';
import 'package:covid19tracker/screens/Preventions.dart';
import 'package:covid19tracker/screens/Symptoms.dart';
import 'package:covid19tracker/styles/AppStyles.dart';
import 'package:covid19tracker/widgets/GlobalCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class IncidenceCases {
  final String year;
  final int clicks;
  final charts.Color color;

  IncidenceCases(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _HomePageState extends State<HomePage> {
  DateFormat fn = DateFormat("dd-M-yyyy");
  AllCasesModel allcases;
  List<CoronaCases> countryCases = [];

  @override
  void initState() {
    super.initState();
    Provider.of<AllCasesProvider>(context, listen: false).getAllCasesProvider();
    Provider.of<TopCasesProvider>(context, listen: false).getCoronaCases();
    //Provider.of<CoronaCasesProvider>(context, listen: false).getCoronaCases();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var allcases = Provider.of<AllCasesProvider>(context).allCases;
    var tops = Provider.of<TopCasesProvider>(context).tops;

    var globalConfirmed = allcases?.cases ?? 0;
    var globalRecovered = allcases?.recovered ?? 0;
    var globalDeaths = allcases?.deaths ?? 0;
    var globalTodayDeaths = allcases?.todayDeaths ?? 0;
    var globalTodayCases = allcases?.todayCases ?? 0;
    var globalCritical = allcases?.critical ?? 0;
    var globalActive = allcases?.active ?? 0;

    var data = [
      IncidenceCases('Confirmed', globalConfirmed, Colors.blue),
      IncidenceCases('Recovered', globalRecovered, Colors.green),
      IncidenceCases('Deaths', globalDeaths, Colors.red),
    ];

    var series = [
      charts.Series(
        domainFn: (IncidenceCases clickData, _) => clickData.year,
        measureFn: (IncidenceCases clickData, _) => clickData.clicks,
        colorFn: (IncidenceCases clickData, _) => clickData.color,
        id: 'IncidenceCases',
        data: data,
      ),
    ];

    var chart = charts.PieChart(
      series,
      animate: true,
      behaviors: [
        new charts.DatumLegend(
          position: charts.BehaviorPosition.end,
          horizontalFirst: false,
          cellPadding: new EdgeInsets.only(
            right: 20.0,
            bottom: 12.0,
          ),
          showMeasures: true,
          legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
        ),
      ],
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: 15,
      ),
    );

    //TextEditingController editingController = TextEditingController();

    var chartWidget = Padding(
      padding: EdgeInsets.all(1.0),
      child: SizedBox(
        height: 140.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Global Cases'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => AboutPage(),
                  ),
                );
              })
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bgl.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 2, 2, 1),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Wrap(
                            spacing: 10.0,
                            runAlignment: WrapAlignment.spaceAround,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Preventions(),
                                  ),
                                ),
                                color: Colors.pink,
                                textColor: Colors.white,
                                shape: Constants.appShape,
                                child: Text(
                                  "Covid-19?",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              RaisedButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Preventions(),
                                  ),
                                ),
                                color: Colors.blue,
                                textColor: Colors.white,
                                shape: Constants.appShape,
                                child: Text(
                                  "Prevention",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              RaisedButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Symptoms(),
                                  ),
                                ),
                                color: Colors.green,
                                textColor: Colors.white,
                                shape: Constants.appShape,
                                child: Text(
                                  "Symptoms",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    chartWidget,
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GlobalCard(
                              caseText: 'Confirmed',
                              caseCount: globalConfirmed,
                              todayCaseCount: globalTodayCases,
                              color: Colors.blue,
                              offset: 50.0,
                              icon: FontAwesomeIcons.virus,
                              fillColor: Colors.white,
                              iconColor: Colors.blue,
                              widthOffset: width * 0.3,
                              heightOffset: height*0.15),
                          SizedBox(
                            width: 5,
                          ),
                          GlobalCard(
                              caseText: 'Deaths',
                              caseCount: globalDeaths,
                              todayCaseCount: globalTodayDeaths,
                              color: Colors.red,
                              offset: 15.0,
                              icon: FontAwesomeIcons.skullCrossbones,
                              fillColor: Colors.white,
                              iconColor: Colors.red,
                              widthOffset: width * 0.3,
                              heightOffset: height*0.15),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GlobalCard(
                              caseText: 'Recovered',
                              caseCount: globalRecovered,
                              todayCaseCount: 0,
                              color: Colors.green,
                              offset: 30.0,
                              icon: FontAwesomeIcons.heart,
                              fillColor: Colors.white,
                              iconColor: Colors.green,
                              widthOffset: width * 0.2,
                              heightOffset: height*0.125),
                          SizedBox(
                            width: 5,
                          ),
                          GlobalCard(
                              caseText: 'Critical',
                              caseCount: globalCritical,
                              todayCaseCount: 0,
                              color: Colors.cyan,
                              offset: 15.0,
                              icon: FontAwesomeIcons.skull,
                              fillColor: Colors.white,
                              iconColor: Colors.cyan,
                              widthOffset: width * 0.2,
                              heightOffset: height*0.125),
                          SizedBox(
                            width: 5,
                          ),
                          GlobalCard(
                              caseText: 'Active',
                              caseCount: globalActive,
                              todayCaseCount: 0,
                              color: Colors.amber,
                              offset: 15.0,
                              icon: FontAwesomeIcons.asterisk,
                              fillColor: Colors.white,
                              iconColor: Colors.amber,
                              widthOffset: width * 0.2,
                              heightOffset: height*0.125),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            if (allcases != null)
                              Text(
                                'Last Update ' +
                                    DateFormat('EEE, MMM d, yyyy kk:mm a')
                                        .format(allcases?.updated)
                                        .toString(),
                                style: AppStyles.txtExtraSmall,
                              ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: Column(
                        children: [
                          Text(
                            'Top Countries',
                            style: AppStyles.txtExtraBig,
                          ),
                          tops.isEmpty
                              ? Center(
                                  child: ColorLoader(),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TopCountries(
                                      cases: tops[0].cases,
                                      country: tops[0].country,
                                      flag: 'assets/flags/' +
                                          tops[0].iso2.toLowerCase() +
                                          '.png',
                                    ),
                                    TopCountries(
                                      cases: tops[1].cases,
                                      country: tops[1].country,
                                      flag: 'assets/flags/' +
                                          tops[1].iso2.toLowerCase() +
                                          '.png',
                                    ),
                                    TopCountries(
                                      cases: tops[2].cases,
                                      country: tops[2].country,
                                      flag: 'assets/flags/' +
                                          tops[2].iso2.toLowerCase() +
                                          '.png',
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopCountries extends StatelessWidget {
  TopCountries({
    this.cases,
    this.country,
    this.flag,
  });

  final String country;
  final String flag;
  final int cases;

  final nf = NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          width: width * 0.3,
          decoration: nMbox,
          duration: Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(flag),
                ),
                Text(
                  country,
                  style: AppStyles.txtBig,
                ),
                Text(
                  nf.format(cases).toString(),
                  style: AppStyles.txtMedium,
                ),
                Text('Confirmed'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
