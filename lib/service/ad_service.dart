import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:helpai/addhelper.dart';

class AdService extends GetxService {
  InterstitialAd? _interstitialAd;
  bool get isInterstitialAdLoaded => _interstitialAd != null;

  Future<void> loadInterstitialAd() async {
    const AdRequest adRequest = AdRequest();
    InterstitialAd.load(
      adUnitId: AdHelper.bannerAdUnitId,
      request: adRequest,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (isInterstitialAdLoaded) {
      _interstitialAd!.show();
    } else {
      print('InterstitialAd is not loaded yet.');
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadInterstitialAd();
  }

  @override
  void onClose() {
    _interstitialAd?.dispose();
    super.onClose();
  }
}
