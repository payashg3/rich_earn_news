import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/coin_manager.dart';

enum Difficulty { easy, medium, hard }

class TapGameScreen extends StatefulWidget {
  const TapGameScreen({super.key});

  @override
  State<TapGameScreen> createState() => _TapGameScreenState();
}

class _TapGameScreenState extends State<TapGameScreen> {
  // ---------------- GAME ----------------
  int taps = 0;
  int timeLeft = 10;
  bool isRunning = false;
  Timer? timer;

  Difficulty difficulty = Difficulty.easy;
  bool rewardUsed = false;

  final Random random = Random();

  // movement
  double offsetX = 0;
  double offsetY = 0;
  static const double tapSize = 120;

  // ---------------- DAILY LIMIT ----------------
  static const int dailyLimit = 5;
  int gamesPlayedToday = 0;

  // ---------------- ADS ----------------
  BannerAd? _bannerAd;
  bool _isBannerLoaded = false;

  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  // ---------------- INIT ----------------
  @override
  void initState() {
    super.initState();
    loadDailyLimit();
    loadBanner();
    loadInterstitial();
    loadRewarded();
  }

  // ---------------- RESET (🔥 MAIN THING) ----------------
  void resetGame() {
    timer?.cancel();

    setState(() {
      taps = 0;
      isRunning = false;
      rewardUsed = false;
      difficulty = Difficulty.easy;
      offsetX = 0;
      offsetY = 0;
      timeLeft = 10;
    });
  }

  // ---------------- DAILY LIMIT ----------------
  Future<void> loadDailyLimit() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().substring(0, 10);

    final savedDate = prefs.getString('date') ?? today;
    if (savedDate != today) {
      await prefs.setInt('games', 0);
      await prefs.setString('date', today);
    }

    gamesPlayedToday = prefs.getInt('games') ?? 0;
    setState(() {});
  }

  Future<void> incrementGames() async {
    final prefs = await SharedPreferences.getInstance();
    gamesPlayedToday++;
    await prefs.setInt('games', gamesPlayedToday);
  }

  // ---------------- ADS ----------------
  void loadBanner() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-9921766463937527/1414403729',
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
      adUnitId: 'ca-app-pub-9921766463937527/9568625292',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (_) => _interstitialAd = null,
      ),
    );
  }

  void loadRewarded() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/1246882760',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => _rewardedAd = ad,
        onAdFailedToLoad: (_) => _rewardedAd = null,
      ),
    );
  }

  // ---------------- GAME ----------------
  void startGame() async {
    if (gamesPlayedToday >= dailyLimit) {
      showLimitDialog();
      return;
    }

    await incrementGames();

    taps = 0;
    rewardUsed = false;
    offsetX = 0;
    offsetY = 0;

    timeLeft = switch (difficulty) {
      Difficulty.easy => 10,
      Difficulty.medium => 8,
      Difficulty.hard => 6,
    };

    isRunning = true;

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
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

    final multiplier = switch (difficulty) {
      Difficulty.easy => 1.0,
      Difficulty.medium => 1.5,
      Difficulty.hard => 2.0,
    };

    final coins = (taps * multiplier).round();
    await CoinManager.addCoins(coins);

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("Game Over"),
        content: Text("You earned $coins coins 🪙"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _interstitialAd?.show();
              _interstitialAd = null;
              loadInterstitial();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // ---------------- MOVE BUTTON ----------------
  void moveButton(BoxConstraints c) {
    final maxX = (c.maxWidth - tapSize) / 2;
    final maxY = (c.maxHeight - tapSize) / 2;

    setState(() {
      offsetX = (random.nextDouble() * 2 - 1) * maxX;
      offsetY = (random.nextDouble() * 2 - 1) * maxY;
    });
  }

  // ---------------- REWARDED (+5 SEC BEFORE START) ----------------
  void watchAdForExtraTime() {
    if (_rewardedAd == null || rewardUsed || isRunning) return;

    _rewardedAd!.show(
      onUserEarnedReward: (_, __) {
        setState(() {
          timeLeft += 5;
          rewardUsed = true;
        });
      },
    );

    _rewardedAd = null;
    loadRewarded();
  }

  // ---------------- UI ----------------
  void showLimitDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Daily Limit Reached"),
        content: const Text("Watch an ad to play 1 extra game 🎥"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              watchAdForExtraTime();
            },
            child: const Text("Watch Ad"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Later"),
          ),
        ],
      ),
    );
  }

  String difficultyLabel(Difficulty d) {
    switch (d) {
      case Difficulty.easy:
        return "Easy";
      case Difficulty.medium:
        return "Medium";
      case Difficulty.hard:
        return "Hard";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tap Challenge"),
        actions: [
          IconButton(icon: const Icon(Icons.restart_alt), onPressed: resetGame),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text("Time: $timeLeft", style: const TextStyle(fontSize: 24)),
            Text(
              "Taps: $taps",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

            // -------- LEVEL SELECT --------
            if (!isRunning)
              DropdownButton<Difficulty>(
                value: difficulty,
                items: Difficulty.values
                    .map(
                      (d) => DropdownMenuItem(
                        value: d,
                        child: Text(difficultyLabel(d)),
                      ),
                    )
                    .toList(),
                onChanged: (d) => setState(() => difficulty = d!),
              ),

            // -------- WATCH AD +5 SEC --------
            if (!isRunning && !rewardUsed && _rewardedAd != null)
              ElevatedButton(
                onPressed: watchAdForExtraTime,
                child: const Text("Watch Ad & +5 sec"),
              ),

            ElevatedButton(
              onPressed: isRunning ? null : startGame,
              child: const Text("START"),
            ),

            const SizedBox(height: 10),

            // -------- GAME AREA --------
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (isRunning && offsetX == 0 && offsetY == 0) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      moveButton(constraints);
                    });
                  }

                  return Center(
                    child: isRunning
                        ? Transform.translate(
                            offset: Offset(offsetX, offsetY),
                            child: GestureDetector(
                              onTap: () {
                                taps++;
                                moveButton(constraints);
                              },
                              child: Container(
                                height: tapSize,
                                width: tapSize,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Text(
                                    "TAP",
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  );
                },
              ),
            ),

            // -------- BANNER --------
            if (_isBannerLoaded)
              SizedBox(
                height: _bannerAd!.size.height.toDouble(),
                width: _bannerAd!.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    super.dispose();
  }
}
