import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsManager {
  static bool testMode = true;

  static String get bannerAdUnitId {
    if (testMode == true) {
      return BannerAd.testAdUnitId;
    } else if (Platform.isAndroid) {
      return "ca-app-pub-7425473498330720/5837476037";
    } else if (Platform.isIOS) {
      return "";
    } else {
      throw UnsupportedError("UnSupported Platform");
    }
  }
}
