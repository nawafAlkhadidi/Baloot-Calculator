
import 'package:baloot/Widgets/win_player.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'Widgets/go_back.dart';
import 'Widgets/reset.dart';
import 'Widgets/widget_of_number.dart';
import 'AdMob/ads_manager.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Variables//22
var play1Controller = TextEditingController();
var play2Controller = TextEditingController();
List<int> sumplayer1 = [];
List<int> sumplayer2 = [];

//method To reset of the game
void _reset() {
  play1Controller.clear();
  play2Controller.clear();
  sumplayer1.clear();
  sumplayer2.clear();
}

//method To go the last game
void _goback() {
  if (sumplayer1.isEmpty == false || sumplayer2.isEmpty == false) {
    sumplayer1.removeAt(sumplayer1.length - 1);
    sumplayer2.removeAt(sumplayer2.length - 1);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  //Banner Ad
  late BannerAd _bannerAd;
  bool _adIsLoaded = false;

  @override
  void initState() {
    _initGoogleMobileAds();
    ///////////
    _bannerAd = BannerAd(
        adUnitId: AdsManager.bannerAdUnitId,
        request: const AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() => _adIsLoaded = true);
          },
          onAdFailedToLoad: (ad, error) {
            setState(() => _adIsLoaded = false);
          },
        ));
    _bannerAd.load();
    /////////
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //102e44
      //  backgroundColor: const Color(0xffE2E5F4),
      backgroundColor: const Color(0xff102e44),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff102e44),
        elevation: 0,
        actions: [
          goBack(
              fun: () {
                setState(() {
                 
                  _goback();
                 
                });
              },
              context: context),
          reset(
              fun: () {
                setState(() {
                  _reset();
                });
              },
              context: context),
        ],
        // ignore: prefer_const_constructors
        title: Text(
          'نشرتنا',
          style: const TextStyle(fontSize: 35),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
               _bannerAdWidget(),
              // لنا - النشره - لهم
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "لهم",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    Expanded(flex: 2, child: SizedBox()),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "لنا",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ],
                ),
              ),
              // total of each Playrs & total the game
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: Row(
                  children: [
                    // ignore: prefer_const_constructors
                    //Sum play1
                    Expanded(
                      flex: 1,
                      child: Text(
                        sumplayer1.sum.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    //Sum totalGame
                    const Expanded(
                      flex: 2,
                      child: SizedBox(),
                    ),
                    // ignore: prefer_const_constructors
                    //Sum play2
                    Expanded(
                      flex: 1,
                      child: Text(
                        sumplayer2.sum.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              // Two textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.01),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      height: 70,
                      width: 120,
                      child: TextField(
                        autofocus: true,
                        keyboardAppearance: Brightness.light,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        onSubmitted: (value) => setState(() {
                          _sum(context);
                        }),
                        controller: play1Controller,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.01),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      height: 70,
                      width: 120,
                      child: TextField(
                        autofocus: true,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) => setState(() {
                          _sum(context);
                        }),
                        controller: play2Controller,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
              ),
              //SUM Button
              TextButton(
                  onPressed: () {
                    setState(() {
                      _sum(context);
                    });
                  },
                  child: const Text(
                    "سجل",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  )),
              const Divider(
                color: Colors.white,
                thickness: 1.5,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: ListView.builder(
                        itemCount: sumplayer1.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return WidgetOfNumber(
                            number: sumplayer1[index].toString(),
                          );
                        },
                      ),
                    ),
                    const Expanded(
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: 1.5,
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: sumplayer1.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return WidgetOfNumber(
                            number: sumplayer2[index].toString(),
                          );
                        },
                      ),
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

  void _sum(BuildContext context) {
    if (play1Controller.text == '') {
      play1Controller = TextEditingController()..text = '0';
    }
    if (play2Controller.text == '') {
      play2Controller = TextEditingController()..text = '0';
    }
    sumplayer1.add(int.parse(play1Controller.text));
    sumplayer2.add(int.parse(play2Controller.text));
    play1Controller.clear();
    play2Controller.clear();

    if (sumplayer1.sum >= 152) {
      winWidget(
        context: context,
        sumPlayer1: sumplayer1.sum,
        sumPlayer2: sumplayer2.sum,
        winPlayr1: false,
        fun1: () {
          setState(() {
            _goback();
          });
        },
        fun2: () {
          setState(() {
            _reset();
          });
        },
      );
    }
    if (sumplayer2.sum >= 152) {
      winWidget(
        context: context,
        sumPlayer1: sumplayer1.sum,
        sumPlayer2: sumplayer2.sum,
        winPlayr1: true,
        fun1: () {
          setState(() {
            _goback();
          });
        },
        fun2: () {
          setState(() {
            _reset();
          });
        },
      );
    }
  }

  //Google mobile ads functions
  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  Widget _bannerAdWidget() {
    if (_adIsLoaded) {
      return Container(
        margin: const EdgeInsets.all(8),
        width: _bannerAd.size.width.toDouble(),
        height: _bannerAd.size.height.toDouble(),
        child: AdWidget(
          ad: _bannerAd,
        ),
      );
    } else {
      return Container(
        width: _bannerAd.size.width.toDouble(),
        height: _bannerAd.size.height.toDouble(),
      );
    }
  }
}
