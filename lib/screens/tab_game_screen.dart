import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/coin_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TapGameScreen extends StatefulWidget {
  const TapGameScreen({super.key});

  @override
  State<TapGameScreen> createState() => _TapGameScreenState();
}

class _TapGameScreenState extends State<TapGameScreen> {
  int taps = 0;
  int timeLeft = 10;
  bool isRunning = false;
  Timer? timer;

  // Banner
  late BannerAd _bannerAd;
  bool _isBannerLoaded = false;

  // Interstitial
  InterstitialAd? _interstitialAd;

  // Rewarded
  RewardedAd? _rewardedAd;

  @override
  void initState() {
    super.initState();
    loadBanner();
    loadInterstitial();
    loadRewarded();
  }

  // ---------------- ADS ----------------

  void loadBanner() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-9921766463937527/1414403729',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) return;
          setState(() => _isBannerLoaded = true);
        },
        onAdFailedToLoad: (ad, error) => ad.dispose(),
      ),
    )..load();
  }

  void loadInterstitial() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/9568625292',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (error) => _interstitialAd = null,
      ),
    );
  }

  void loadRewarded() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/1246882760',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => _rewardedAd = ad,
        onAdFailedToLoad: (error) => _rewardedAd = null,
      ),
    );
  }

  // ---------------- GAME ----------------

  void startGame() {
    taps = 0;
    isRunning = true;

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft == 0) {
        endGame();
      } else {
        setState(() => timeLeft--);
      }
    });

    setState(() {});
  }

  void endGame() async {
    timer?.cancel();
    isRunning = false;

    await CoinManager.addCoins(taps);

    if (!mounted) return;

    // Interstitial after game
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null;
      loadInterstitial();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Game Over"),
        content: Text("You earned $taps coins 🪙"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                timeLeft = 10; // reset for next round
              });
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // Rewarded BEFORE start
  void watchAdForExtraTime() {
    if (_rewardedAd == null) return;

    _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) {
        setState(() {
          timeLeft += 5; // add before game
        });
      },
    );

    _rewardedAd = null;
    loadRewarded();
  }

  @override
  void dispose() {
    timer?.cancel();
    _bannerAd.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    super.dispose();
  }

  // ---------------- UI ----------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tap Challenge")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Time: $timeLeft sec",
                      style: const TextStyle(fontSize: 28),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Taps: $taps",
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

                    GestureDetector(
                      onTap: isRunning ? () => setState(() => taps++) : null,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: isRunning ? Colors.green : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            "TAP",
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Rewarded BEFORE start
                    if (_rewardedAd != null)
                      ElevatedButton(
                        onPressed: isRunning ? null : watchAdForExtraTime,
                        child: const Text("Watch Ad & +5 sec"),
                      ),

                    const SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: isRunning ? null : startGame,
                      child: const Text("START"),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Banner
            if (_isBannerLoaded)
              Container(
                height: _bannerAd.size.height.toDouble(),
                width: _bannerAd.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd),
              ),
          ],
        ),
      ),
    );
  }
}
