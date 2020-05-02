import 'package:covid19tracker/constants/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 2, 2, 1),
          child: Row(
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
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: Constants.appShape,
                      child: Text(
                        "What is Covid-19?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.green,
                      textColor: Colors.white,
                      shape: Constants.appShape,
                      child: Text(
                        "Symptoms & Prevention",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
