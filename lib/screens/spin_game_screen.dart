import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import '../utils/coin_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpinGameScreen extends StatefulWidget {
  const SpinGameScreen({super.key});

  @override
  State<SpinGameScreen> createState() => _SpinGameScreenState();
}

class _SpinGameScreenState extends State<SpinGameScreen> {
  late StreamController<int> controller;

  final List<int> rewards = [5, 10, 15, 20, 25, 50];

  int selected = 0;
  int totalCoins = 0;
  int spinsToday = 0;
  final int dailyLimit = 3;
  int lastIndex = 0;

  bool hasSpun = false;

  // Ads
  late BannerAd _bannerAd;
  bool _isBannerLoaded = false;

  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  bool _isRewardedLoaded = false;

  @override
  void initState() {
    super.initState();
    controller = StreamController<int>.broadcast(); // IMPORTANT
    loadCoins();
    loadSpins();
    loadBanner();
    loadInterstitial();
    loadRewarded();
  }

  // ---------------- COINS ----------------

  Future<void> loadCoins() async {
    final coins = await CoinManager.getCoins();
    if (!mounted) return;
    setState(() {
      totalCoins = coins;
    });
  }

  // ---------------- SPINS PERSIST ----------------

  Future<void> loadSpins() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDate = prefs.getString("lastSpinDate");
    final today = DateTime.now().toString().substring(0, 10);

    if (savedDate == today) {
      spinsToday = prefs.getInt("spinsToday") ?? 0;
    } else {
      spinsToday = 0;
      prefs.setString("lastSpinDate", today);
      prefs.setInt("spinsToday", 0);
    }

    setState(() {});
  }

  Future<void> saveSpins() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("spinsToday", spinsToday);
  }

  // ---------------- ADS ----------------

  void loadBanner() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-9921766463937527/1881706964',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) return;
          setState(() => _isBannerLoaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
  }

  void loadInterstitial() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/3873046105',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          _interstitialAd = null;
        },
      ),
    );
  }

  void loadRewarded() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/6708266462',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedLoaded = true;
        },
        onAdFailedToLoad: (error) {
          _isRewardedLoaded = false;
        },
      ),
    );
  }

  // ---------------- GAME LOGIC ----------------

  void spin() {
    if (spinsToday >= dailyLimit) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No spins left. Watch ad for more")),
      );
      return;
    }

    hasSpun = true;
    final index = Fortune.randomInt(0, rewards.length);
    lastIndex = index;
    controller.add(index);
  }

  void showRewardedForExtraSpin() {
    if (_rewardedAd == null) return;

    _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) {
        setState(() {
          spinsToday--; // 1 extra spin
        });
        saveSpins();
      },
    );

    _rewardedAd = null;
    loadRewarded();
  }

  @override
  void dispose() {
    controller.close();
    _bannerAd.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Spin & Win")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Coins: $totalCoins 🪙",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text("Spins left: ${dailyLimit - spinsToday}"),
                  const SizedBox(height: 20),

                  SizedBox(
                    height: 300,
                    child: FortuneWheel(
                      selected: controller.stream,
                      indicators: const [
                        FortuneIndicator(
                          alignment: Alignment.topCenter,
                          child: TriangleIndicator(color: Colors.red),
                        ),
                      ],
                      items: [
                        for (var reward in rewards)
                          FortuneItem(
                            child: Text(
                              reward.toString(),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                      onAnimationEnd: () async {
                        if (!hasSpun) return; // <<< KEY LINE

                        final win = rewards[lastIndex];
                        await CoinManager.addCoins(win);

                        if (!mounted) return;

                        setState(() {
                          selected = win;
                          spinsToday++;
                          totalCoins += win;
                        });

                        saveSpins();
                        hasSpun = false;

                        // Interstitial ONLY after 3rd real spin
                        if (spinsToday == dailyLimit &&
                            _interstitialAd != null) {
                          _interstitialAd!.show();
                          _interstitialAd = null;
                          loadInterstitial();
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                  Text(
                    "Last win: $selected",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(onPressed: spin, child: const Text("SPIN")),

                  if (spinsToday >= dailyLimit && _rewardedAd != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: ElevatedButton(
                        onPressed: showRewardedForExtraSpin,
                        child: const Text("Watch Ad & Get 1 Extra Spin"),
                      ),
                    ),
                ],
              ),
            ),

            if (_isBannerLoaded)
              SizedBox(
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
