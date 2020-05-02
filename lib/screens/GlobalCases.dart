import 'package:covid19tracker/widgets/GlobalCasesList.dart';
import 'package:flutter/material.dart';

class GlobalCases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Global Cases'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                0.0,
              ),
            ),
          ),
          height: height,
          child: GlobalCasesList(),
        ),
      ),
    );
  }
}
