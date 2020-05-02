import 'package:covid19tracker/widgets/CoronavirusMapWidget.dart';
import 'package:flutter/material.dart';

class CaseMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Map'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height * 0.9,
          child: CoronavirusMapWidget(),
        ),
      ),
    );
  }
}
