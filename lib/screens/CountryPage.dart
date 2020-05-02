import 'package:covid19tracker/models/CoronaCases.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text("Country Page")),
    );
  }
}
