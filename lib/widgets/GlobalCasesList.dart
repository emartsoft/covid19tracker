import 'package:covid19tracker/components/loader.dart';
import 'package:covid19tracker/helpers/colors.dart';
import 'package:covid19tracker/helpers/screen.dart';
import 'package:covid19tracker/models/CoronaCases.dart';
import 'package:covid19tracker/providers/CoronaCasesProvider.dart';
import 'package:covid19tracker/screens/CountryPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class GlobalCasesList extends StatefulWidget {
  @override
  _GlobalCasesListState createState() => _GlobalCasesListState();
}

class _GlobalCasesListState extends State<GlobalCasesList> {
  List<CoronaCases> _cases, sample, data;
  final nf = NumberFormat("#,###");
  final TextEditingController _controller = new TextEditingController();

  Future<void> _getCountryCases() async {
    //_pageCount = 0;
    List<CoronaCases> countryCases =
        await CoronaCasesProvider().getCoronaCases();
    if (!mounted) {
      return;
    }

    setState(() {
      _cases = countryCases;
      sample = _cases;
      data = sample;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCountryCases();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
      //backgroundColor:Color(0xFFFF3B4254),
      backgroundColor: BackgroundColor,
      body: _cases == null
          ? Center(
              child: ColorLoader(),
            )
          : RefreshIndicator(
              onRefresh: _getCountryCases,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: screenAwareSize(300, context),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: screenAwareSize(40, context),
                      decoration: BoxDecoration(
                        color: Color(0xFF262626),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                      child: TextField(
                        style: new TextStyle(color: Colors.white),
                        controller: _controller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: 10.0,
                          ),
                          border: InputBorder.none,
                          hintText: 'Search Country...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _controller.clear();
                            },
                            child: Icon(
                              Icons.cancel,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        onChanged: (text) {
                          setState(
                            () {
                              if (text != '')
                                data = sample
                                    .where((r) => (r.country
                                        .toLowerCase()
                                        .contains(text.trim().toLowerCase())))
                                    .toList();
                              else
                                data = sample;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: data
                          .map(
                            (cases) => Padding(
                              padding: const EdgeInsets.all(3),
                              child: Container(
                                padding: EdgeInsets.only(left: 7),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (c, a1, a2) => CountryPage(
                                          countryCase: cases,
                                        ),
                                        transitionsBuilder:
                                            (c, anim, a2, child) =>
                                                ScaleTransition(
                                          scale: Tween<double>(
                                            begin: 0.0,
                                            end: 1.0,
                                          ).animate(
                                            CurvedAnimation(
                                              parent: anim,
                                              curve: Curves.fastOutSlowIn,
                                            ),
                                          ),
                                          child: child,
                                        ),
                                        transitionDuration:
                                            Duration(milliseconds: 500),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    color: BackgroundColor,
                                    elevation: 15,
                                    margin: new EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    shadowColor: Colors.white,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage((cases
                                                    .countryInfo?.iso2 !=
                                                null)
                                            ? 'assets/flags/${cases.countryInfo?.iso2?.toLowerCase()}.png'
                                            : 'assets/pin.png'),
                                      ),
                                      title: Text(
                                        cases.country,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "Confirmed Cases : " +
                                            nf.format(cases.cases).toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(
                                          FontAwesomeIcons.arrowAltCircleRight,
                                          color: Colors.white,
                                        ),
                                        iconSize: 31,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (c, a1, a2) =>
                                                  CountryPage(
                                                countryCase: cases,
                                              ),
                                              transitionsBuilder:
                                                  (c, anim, a2, child) =>
                                                      ScaleTransition(
                                                scale: Tween<double>(
                                                  begin: 0.0,
                                                  end: 1.0,
                                                ).animate(
                                                  CurvedAnimation(
                                                    parent: anim,
                                                    curve: Curves.fastOutSlowIn,
                                                  ),
                                                ),
                                                child: child,
                                              ),
                                              transitionDuration:
                                                  Duration(milliseconds: 500),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
