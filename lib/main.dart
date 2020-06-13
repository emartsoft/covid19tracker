import 'package:covid19tracker/helpers/colors.dart';
import 'package:covid19tracker/providers/AllCasesProvider.dart';
import 'package:covid19tracker/providers/CoronaCasesProvider.dart';
import 'package:covid19tracker/screens/CaseMap.dart';
import 'package:covid19tracker/screens/GlobalCases.dart';
import 'package:covid19tracker/screens/HomePage.dart';
import 'package:covid19tracker/screens/NewsPage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AllCasesProvider()),
        ChangeNotifierProvider(create: (_) => CoronaCasesProvider()),
        ChangeNotifierProvider(create: (_) => TopCasesProvider()),
      ],
      child: DevicePreview(
        enabled: false,
        builder: (context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19',
      theme: ThemeData(
        primaryColor: BackgroundColor,
        textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashScreen.navigate(
        name: 'assets/flare/Loading.flr',
        backgroundColor: Colors.white,
        next: (context) => MainEntryPage(),
        until: () => Future.delayed(Duration(seconds: 2)),
        startAnimation: 'Alarm',
      ),
    );
  }
}

GlobalKey globalWebKey = GlobalKey();

class MainEntryPage extends StatefulWidget {
  @override
  _MainEntryPageState createState() => _MainEntryPageState();
}

class _MainEntryPageState extends State<MainEntryPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    GlobalCases(),
    CaseMap(),
    NewsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25),),
          boxShadow: [
            BoxShadow(
              spreadRadius: -10,
              blurRadius: 60,
              color: Colors.black.withOpacity(.20),
              offset: Offset(0, 15),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
            child: GNav(
              gap: 3,
              activeColor: Colors.white,
              color: Colors.white,
              backgroundColor: BackgroundColor,
              iconSize: 25,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.pink,
              tabMargin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              tabs: [
                GButton(
                  icon: FontAwesomeIcons.home,
                  iconActiveColor: Colors.white,
                  iconColor: Colors.grey,
                  text: ' Home',
                ),
                GButton(
                  icon: FontAwesomeIcons.globeAfrica,
                  iconActiveColor: Colors.white,
                  iconColor: Colors.grey,
                  text: ' Global',
                ),
                GButton(
                  icon: FontAwesomeIcons.globe,
                  iconActiveColor: Colors.white,
                  iconColor: Colors.grey,
                  text: ' Map',
                ),
                GButton(
                  icon: FontAwesomeIcons.newspaper,
                  iconActiveColor: Colors.white,
                  iconColor: Colors.grey,
                  text: ' News',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(
                  () {
                    _selectedIndex = index;
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
