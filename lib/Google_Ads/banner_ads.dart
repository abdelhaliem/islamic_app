import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:islamic/Google_Ads/ads_manager.dart';

class MyBannerAds extends StatefulWidget {
  const MyBannerAds({Key? key}) : super(key: key);

  @override
  _MyBannerAdsState createState() => _MyBannerAdsState();
}

class _MyBannerAdsState extends State<MyBannerAds> {
  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  late BannerAd _bannerAd;
  bool _adIsLoaded = false;

  @override
  void initState() {
    super.initState();
    _initGoogleMobileAds();

    _bannerAd = BannerAd(
      adUnitId: AdsManager.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(onAdFailedToLoad: (ad, error) {
        setState(() {
          _adIsLoaded = false;
        });
      }, onAdLoaded: (ad) {
        setState(() {
          _adIsLoaded = true;
        });
      }),
    );
    _bannerAd.load();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _adIsLoaded
        ? Container(
            margin: const EdgeInsets.all(8),
            width: _bannerAd.size.width.toDouble(),
            height: _bannerAd.size.height.toDouble(),
            child: AdWidget(
              ad: _bannerAd,
            ),
          )
        : Container();
  }
// if(_adIsLoaded){
// return Container(
// margin: const EdgeInsets.all(8),
// width: _bannerAd.size.width.toDouble(),
// height: _bannerAd.size.height.toDouble(),
// child: AdWidget(
// ad: _bannerAd,
// ),
// );
// }else{
// return Container();
}
