import 'dart:async';
import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/coin_manager.dart';

class PatternMatchScreen extends StatefulWidget {
  const PatternMatchScreen({super.key});

  @override
  State<PatternMatchScreen> createState() => _PatternMatchScreenState();
}

class _PatternMatchScreenState extends State<PatternMatchScreen> {
  final Random random = Random();

  int level = 1;
  int timeLeft = 5;
  int totalCoins = 0;

  bool showPattern = true;
  Timer? timer;

  List<Color> baseColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];

  List<Color> correctPattern = [];
  List<List<Color>> options = [];

  // Ads
  BannerAd? _bannerAd;
  bool _isBannerLoaded = false;
  RewardedAd? _rewardedAd;

  @override
  void initState() {
    super.initState();
    loadCoins();
    loadBanner();
    loadRewarded();
    generateLevel();
  }

  // ---------------- COINS ----------------

  Future<void> loadCoins() async {
    int coins = await CoinManager.getCoins();
    if (!mounted) return;
    setState(() => totalCoins = coins);
  }

  // ---------------- ADS ----------------

  void loadBanner() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-9921766463937527/1591671153',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isBannerLoaded = true),
        onAdFailedToLoad: (ad, _) => ad.dispose(),
      ),
    )..load();
  }

  void loadRewarded() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/2208610648',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => _rewardedAd = ad,
        onAdFailedToLoad: (_) => _rewardedAd = null,
      ),
    );
  }

  // ---------------- LEVEL ----------------

  void generateLevel() {
    showPattern = true;
    timeLeft = math.max(3, 6 - level);

    int patternSize = math.min(6 + level, 12);

    correctPattern = List.generate(
      patternSize,
      (_) => baseColors[random.nextInt(baseColors.length)],
    );

    generateOptions();

    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      setState(() => showPattern = false);
      startTimer();
    });

    setState(() {});
  }

  void generateOptions() {
    options.clear();
    options.add(correctPattern);

    while (options.length < 4) {
      List<Color> fake = List.generate(
        correctPattern.length,
        (_) => baseColors[random.nextInt(baseColors.length)],
      );

      if (!listEquals(fake, correctPattern)) {
        options.add(fake);
      }
    }

    options.shuffle();
  }

  // ---------------- TIMER ----------------

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft == 0) {
        t.cancel();
        showGameOver(); // ⬅ timeout = game over
      } else {
        setState(() => timeLeft--);
      }
    });
  }

  // ---------------- CHECK ----------------

  Future<void> checkAnswer(List<Color> selected) async {
    timer?.cancel();

    if (listEquals(selected, correctPattern)) {
      await CoinManager.addCoins(10);
      await loadCoins();

      level++;
      generateLevel();
    } else {
      showGameOver();
    }
  }

  // ---------------- GAME OVER ----------------

  void showGameOver() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("Game Over"),
        content: Text("You reached Level $level"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              resetGame();
            },
            child: const Text("Quit"),
          ),
          if (_rewardedAd != null)
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                _rewardedAd!.show(
                  onUserEarnedReward: (_, __) {
                    level = math.max(1, level - 1);
                    generateLevel();
                  },
                );

                _rewardedAd = null;
                loadRewarded();
              },
              child: const Text("Revive"),
            ),
        ],
      ),
    );
  }

  void resetGame() {
    level = 1;
    generateLevel();
  }

  // ---------------- GRID ----------------

  Widget buildPattern(List<Color> pattern) {
    int crossAxis = math.sqrt(pattern.length).ceil();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pattern.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxis,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
      ),
      itemBuilder: (_, i) {
        return Container(
          decoration: BoxDecoration(
            color: pattern[i],
            borderRadius: BorderRadius.circular(6),
          ),
        );
      },
    );
  }

  // ---------------- BUILD ----------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pattern Match"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "🪙 $totalCoins",
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          Text("Level $level",
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          Text("⏳ $timeLeft"),

          const SizedBox(height: 10),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (showPattern) ...[
                    const Text("Memorize!"),
                    const SizedBox(height: 12),
                    buildPattern(correctPattern),
                  ] else ...[
                    const Text("Select Correct Pattern"),
                    const SizedBox(height: 12),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: options.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (_, i) {
                        return GestureDetector(
                          onTap: () => checkAnswer(options[i]),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: buildPattern(options[i]),
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),

          if (_isBannerLoaded)
            SizedBox(
              height: _bannerAd!.size.height.toDouble(),
              width: _bannerAd!.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    _bannerAd?.dispose();
    _rewardedAd?.dispose();
    super.dispose();
  }
}