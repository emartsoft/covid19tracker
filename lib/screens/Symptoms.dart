import 'package:covid19tracker/styles/AppStyles.dart';
import 'package:covid19tracker/widgets/CardScrollWidget.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  Symptoms({
    Key key,
  }) : super(key: key);

  @override
  _SymptomsState createState() => new _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  String imageUrl = "bgrs.jpeg";
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF1b1e44),
              Color(0xFF2d3447),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Symptoms'),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Symptoms",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text(
                        'Less common symptoms:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                      Text(
                        '- aches and pains',
                        style: AppStyles.txtMidText,
                      ),
                      Text(
                        '- sore throat',
                        style: AppStyles.txtMidText,
                      ),
                      Text(
                        '- diarrhoea',
                        style: AppStyles.txtMidText,
                      ),
                      Text(
                        '- conjunctivitis',
                        style: AppStyles.txtMidText,
                      ),
                      Text(
                        '- headache',
                        style: AppStyles.txtMidText,
                      ),
                      Text(
                        '- loss of taste or smell',
                        style: AppStyles.txtMidText,
                      ),
                      Text(
                        '- a rash on skin, or discolouration of fingers or toes',
                        style: AppStyles.txtMidText,
                      ),
                      Text(
                        'Serious symptoms:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                      Text(
                        '- chest pain or pressure',
                        style: AppStyles.txtMidText,
                      ),
                      Text(
                        '- loss of speech or movement',
                        style: AppStyles.txtMidText,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
