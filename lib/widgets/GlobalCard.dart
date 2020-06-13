import 'package:covid19tracker/components/NeumorphicCard.dart';
import 'package:covid19tracker/styles/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:neumorphic/neumorphic.dart';

class GlobalCard extends StatelessWidget {
  GlobalCard({
    Key key,
    @required this.caseText,
    @required this.caseCount,
    @required this.todayCaseCount,
    @required this.color,
    @required this.offset,
    @required this.icon,
    @required this.fillColor,
    @required this.iconColor,
    @required this.widthOffset,
    @required this.heightOffset
  }) : super(key: key);

  final nf = NumberFormat("#,###");
  final int caseCount;
  final int todayCaseCount;
  final String caseText;
  final Color color;
  final double offset;
  final IconData icon;
  final Color fillColor;
  final Color iconColor;
  final double widthOffset;
  final double heightOffset;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width * widthOffset,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.65),
                offset: Offset(2, 2),
                blurRadius: 5,
              ),
              BoxShadow(
                color: mCL,
                offset: Offset(-5, -5),
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        border: Border.all(color: iconColor),
                        shape: BoxShape.circle,
                        color: fillColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          icon,
                          color: iconColor,
                          size: 15,
                        ),
                      ),
                    ),
                    if (todayCaseCount > 0)
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          border: Border.all(color: iconColor),
                          borderRadius: BorderRadius.circular(25.0),
                          color: fillColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '24H +' + nf.format(todayCaseCount).toString(),
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ),
                    if (todayCaseCount == 0) Container(),
                  ],
                ),
              ),
              SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      nf.format(caseCount).toString(),
                      style: AppStyles.txtMedium,
                    ),
                    Text(
                      caseText,
                      style: AppStyles.txtMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
