import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ColorMixGameScreen extends StatefulWidget {
  const ColorMixGameScreen({super.key});

  @override
  State<ColorMixGameScreen> createState() => _ColorMixGameScreenState();
}

class _ColorMixGameScreenState extends State<ColorMixGameScreen> {
  int level = 1;
  int chancesLeft = 3;
  List<Color> selectedColors = [];

  final Random random = Random();

  // -------- COLORS --------
  final List<Color> masterPalette = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.purple,
  ];

  final List<Color> possibleTargets = [
    Colors.purple,
    Colors.orange,
    Colors.green,
  ];

  Color targetColor = Colors.purple;

  // -------- ADS --------
  BannerAd? _bannerAd;
  bool _isBannerLoaded = false;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  @override
  void initState() {
    super.initState();
    generateTarget();
    loadBanner();
    loadInterstitial();
    loadRewarded();
  }

  void generateTarget() {
    targetColor = possibleTargets[random.nextInt(possibleTargets.length)];
  }

  // -------- ADS LOAD --------
  void loadBanner() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-9921766463937527/1197392241',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isBannerLoaded = true),
        onAdFailedToLoad: (ad, _) => ad.dispose(),
      ),
    )..load();
  }

  void loadInterstitial() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/6269019438',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (_) => _interstitialAd = null,
      ),
    );
  }

  void loadRewarded() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/3642856098',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => _rewardedAd = ad,
        onAdFailedToLoad: (_) => _rewardedAd = null,
      ),
    );
  }

  // -------- MIX LOGIC --------
  Color get mixedColor {
    if (selectedColors.length < 2) return Colors.grey.shade300;
    if (selectedColors.contains(Colors.red) &&
        selectedColors.contains(Colors.blue))
      return Colors.purple;
    if (selectedColors.contains(Colors.red) &&
        selectedColors.contains(Colors.yellow))
      return Colors.orange;
    if (selectedColors.contains(Colors.blue) &&
        selectedColors.contains(Colors.yellow))
      return Colors.green;
    return Colors.brown;
  }

  void checkResult() {
    if (mixedColor == targetColor) {
      nextLevel();
    } else {
      chancesLeft--;
      selectedColors.clear();
      if (chancesLeft == 0) showReviveDialog();
      setState(() {});
    }
  }

  void nextLevel() {
    setState(() {
      level++;
      chancesLeft = 3;
      selectedColors.clear();
      generateTarget();
    });

    if (level % 3 == 0 && _interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null;
      loadInterstitial();
    }
  }

  void showReviveDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("Out of Chances"),
        content: const Text("Watch ad to revive"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              watchAdToRevive();
            },
            child: const Text("Revive"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              resetGame();
            },
            child: const Text("Quit"),
          ),
        ],
      ),
    );
  }

  void watchAdToRevive() {
    if (_rewardedAd == null) return;
    _rewardedAd!.show(
      onUserEarnedReward: (_, __) {
        setState(() => chancesLeft = 3);
      },
    );
    _rewardedAd = null;
    loadRewarded();
  }

  void resetGame() {
    setState(() {
      level = 1;
      chancesLeft = 3;
      selectedColors.clear();
      generateTarget();
    });
  }

  // -------- UI --------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Mix Lab"),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.restart_alt), onPressed: resetGame),
        ],
      ),
      body: Stack(
        children: [
          // 🎮 GAME AREA (ALWAYS CENTERED)
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Level $level",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Chances: $chancesLeft ❤️"),

                  const SizedBox(height: 20),

                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: targetColor,
                      shape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: mixedColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black12),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 16,
                    children: masterPalette.map((color) {
                      final isSelected = selectedColors.contains(color);
                      return GestureDetector(
                        onTap: () {
                          if (selectedColors.length == 2 || isSelected) return;
                          setState(() => selectedColors.add(color));
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: selectedColors.length == 2 ? checkResult : null,
                    child: const Text("MIX"),
                  ),

                  const SizedBox(height: 80), // banner space
                ],
              ),
            ),
          ),

          // 📢 BANNER (BOTTOM CENTER, SEPARATE)
          if (_isBannerLoaded)
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: _bannerAd!.size.height.toDouble(),
                width: _bannerAd!.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    super.dispose();
  }
}
