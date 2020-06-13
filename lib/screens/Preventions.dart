import 'package:covid19tracker/components/gf_carousel.dart';
import 'package:covid19tracker/widgets/SymptomsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:auto_size_text/auto_size_text.dart';

final List<SymptomsCard> cards = [
  SymptomsCard(
    index: 0,
    imageUrl: "assets/preventions/handwash.jpg",
    symptoms: 'Wash your Hands',
    desc: 'Wash your hands often with soap and water for atleast 20 seconds.',
    url: 'https://www.cdc.gov/handwashing/when-how-handwashing.html',
  ),
  SymptomsCard(
    index: 1,
    imageUrl: "assets/preventions/facemask.jpg",
    symptoms: 'Wear Facemask',
    desc: 'Cover your nose and mouth with an approved face mask.',
    url:
        'https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/diy-cloth-face-coverings.html',
  ),
  SymptomsCard(
    index: 2,
    imageUrl: "assets/preventions/SocialDistance.png",
    symptoms: 'Social Distance',
    desc: 'Avoid close contact and keep a distance of about 2 metres.',
    url:
        'https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/social-distancing.html',
  ),
  SymptomsCard(
    index: 3,
    imageUrl: "assets/preventions/covercough.jpg",
    symptoms: 'Cover Coughs',
    desc: 'While coughing or sneezing cover your nose and mouth.',
    url:
        'https://www.cdc.gov/healthywater/hygiene/etiquette/coughing_sneezing.html',
  ),
  SymptomsCard(
    index: 4,
    imageUrl: "assets/preventions/crowdedplace.jpg",
    symptoms: 'Avoid crowded places',
    desc: 'Avoid large events or mass gatherings.',
    url:
        'https://www.cdc.gov/coronavirus/2019-ncov/community/large-events/mass-gatherings-ready-for-covid-19.html',
  ),
];

class Preventions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Prevention'),
      ),
      body: SingleChildScrollView(
        child: GFCarousel(
          //              initialPage: 1,
          aspectRatio: 0.6,
          pagerSize: 12,
          activeIndicator: Colors.pink,
          passiveIndicator: Colors.pink.withOpacity(0.2),
          viewportFraction: 0.8,
          //              aspectRatio: 1,
          autoPlay: true,
          enlargeMainPage: false,
          pagination: true,
          items: cards
              .map(
                (card) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Positioned(
                    top: 10,
                    bottom: 10,
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: <Widget>[
                        Image.asset(
                          card.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: height*0.05,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: height * 0.25,
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0,
                                    ),
                                    child: AutoSizeText(
                                      card.symptoms,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width*0.06,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      width: width*0.6,
                                      child: AutoSizeText(
                                        card.desc,
                                        maxLines: 3,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width*0.03,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      bottom: 12.0,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SafeArea(
                                              child: InAppWebView(
                                                initialUrl: '${card.url}',
                                                initialOptions:
                                                    InAppWebViewWidgetOptions(
                                                  inAppWebViewOptions:
                                                      InAppWebViewOptions(
                                                    debuggingEnabled: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 22.0,
                                          vertical: 6.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius: BorderRadius.circular(
                                            20.0,
                                          ),
                                        ),
                                        child: Text(
                                          "Read More",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          //              onPageChanged: (int index) {
          //                setState(() {
          //                   index;
          //                });
          //              },
        ),
      ),
    );
  }
}
