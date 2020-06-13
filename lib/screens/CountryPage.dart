import 'package:covid19tracker/components/NeumorphicCard.dart';
import 'package:covid19tracker/helpers/colors.dart';
import 'package:covid19tracker/models/CoronaCases.dart';
import 'package:covid19tracker/styles/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CountryPage extends StatefulWidget {
  final CoronaCases countryCase;
  CountryPage({
    this.countryCase,
  });

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat("#,###");
    String flagUrl = '';
    if (widget.countryCase.countryInfo?.iso2 != null)
      flagUrl =
          'assets/flags/${widget.countryCase.countryInfo?.iso2?.toLowerCase()}.png';
    else
      flagUrl = 'assets/pin.png';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryCase.country + ' Cases'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: BackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(10, 10),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: mCL,
                      offset: Offset(-10, -10),
                      blurRadius: 10,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.countryCase.country,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          height: 40,
                          width: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              flagUrl,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Last Update ' +
                            DateFormat('EEE, MMM d, yyyy kk:mm a')
                                .format(widget.countryCase?.updated)
                                .toString(),
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              FontAwesomeIcons.dotCircle,
                              color: Colors.red,
                              size: 15,
                            ),
                            Text(
                              'Active Cases',
                              style: AppStyles.txtBig,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                nf.format(widget.countryCase?.cases).toString(),
                                style: AppStyles.txtBig)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              FontAwesomeIcons.dotCircle,
                              color: Colors.blue,
                              size: 15,
                            ),
                            Text(
                              'Deaths Cases',
                              style: AppStyles.txtBig,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                nf
                                    .format(widget.countryCase?.deaths)
                                    .toString(),
                                style: AppStyles.txtBig)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              FontAwesomeIcons.dotCircle,
                              color: Colors.green,
                              size: 15,
                            ),
                            Text(
                              'Recovered Cases',
                              style: AppStyles.txtBig,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              nf
                                  .format(widget.countryCase?.recovered)
                                  .toString(),
                              style: AppStyles.txtBig,
                            )
                          ],
                        ),
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
