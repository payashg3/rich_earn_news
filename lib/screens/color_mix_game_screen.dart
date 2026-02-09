import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/coin_manager.dart';

class ColorMixGameScreen extends StatefulWidget {
  const ColorMixGameScreen({super.key});

  @override
  State<ColorMixGameScreen> createState() => _ColorMixGameScreenState();
}

class _ColorMixGameScreenState extends State<ColorMixGameScreen> {
  int level = 1;
  int chancesLeft = 4;
  int correctCount = 0;
  int coins = 0;

  List<Color> selectedColors = [];
  final Random random = Random();

  // ---------------- COLORS ----------------
  final List<Color> allColors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.brown,
    Colors.teal,
    Colors.pink,
    Colors.cyan,
    Colors.indigo,
  ];

  late List<Color> currentPalette;
  late Color targetColor;

  // ---------------- ADS ----------------
  BannerAd? _bannerAd;
  bool _isBannerLoaded = false;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  @override
  void initState() {
    super.initState();
    generateNewRound();
    loadBanner();
    loadInterstitial();
    loadRewarded();
  }

  // ---------------- ROUND ----------------

  void generateNewRound() {
    selectedColors.clear();

    currentPalette = List.from(allColors)..shuffle();
    currentPalette = currentPalette.take(4).toList();

    targetColor = getRandomValidTarget();
  }

  Color getRandomValidTarget() {
    List<Color> possible = [];

    for (int i = 0; i < currentPalette.length; i++) {
      for (int j = i + 1; j < currentPalette.length; j++) {
        possible.add(mixColors(currentPalette[i], currentPalette[j]));
      }
    }

    return possible[random.nextInt(possible.length)];
  }

  // ---------------- RGB MIX ----------------

  Color mixColors(Color c1, Color c2) {
    return Color.fromARGB(
      255,
      ((c1.red + c2.red) ~/ 2),
      ((c1.green + c2.green) ~/ 2),
      ((c1.blue + c2.blue) ~/ 2),
    );
  }

  Color get mixedColor {
    if (selectedColors.length < 2) return Colors.grey.shade300;
    return mixColors(selectedColors[0], selectedColors[1]);
  }

  // ---------------- RESULT ----------------

  void checkResult() async {
    if (mixedColor.value == targetColor.value) {
      correctCount++;

      if (correctCount == 2) {
        await giveLevelReward();
        nextLevel();
        return;
      }
    } else {
      chancesLeft--;

      if (chancesLeft == 0) {
        showReviveDialog();
        return;
      }
    }

    generateNewRound();
    setState(() {});
  }

  // ---------------- REWARD ----------------

  Future<void> giveLevelReward() async {
    int levelReward = 20;
    coins += levelReward;
    await CoinManager.addCoins(levelReward);
  }

  void nextLevel() {
    setState(() {
      level++;
      chancesLeft = 4;
      correctCount = 0;
      generateNewRound();
    });

    if (level % 3 == 0 && _interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null;
      loadInterstitial();
    }
  }

  void resetGame() {
    setState(() {
      level = 1;
      chancesLeft = 4;
      correctCount = 0;
      coins = 0;
      generateNewRound();
    });
  }

  // ---------------- REVIVE ----------------

  void showReviveDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("Out of Chances"),
        content: const Text("Watch ad to revive?"),
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
              showGameOver();
            },
            child: const Text("Quit"),
          ),
        ],
      ),
    );
  }

  void watchAdToRevive() {
    if (_rewardedAd == null) {
      showGameOver();
      return;
    }

    _rewardedAd!.show(
      onUserEarnedReward: (_, __) {
        setState(() {
          chancesLeft = 4;
        });
      },
    );

    _rewardedAd = null;
    loadRewarded();
  }

  void showGameOver() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("Game Over"),
        content: Text("You reached Level $level\nCoins: $coins 🪙"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              resetGame();
            },
            child: const Text("Restart"),
          )
        ],
      ),
    );
  }

  // ---------------- ADS LOAD ----------------

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

  // ---------------- UI ----------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Mix Lab"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(child: Text("🪙 $coins")),
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Level $level",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  Text("Chances: $chancesLeft"),
                  Text("Correct: $correctCount / 2"),

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
                    spacing: 16,
                    children: currentPalette.map((color) {
                      final isSelected = selectedColors.contains(color);

                      return GestureDetector(
                        onTap: () {
                          if (selectedColors.length == 2 || isSelected) return;
                          setState(() {
                            selectedColors.add(color);
                          });
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
                    onPressed:
                        selectedColors.length == 2 ? checkResult : null,
                    child: const Text("MIX"),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),

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
