import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/coin_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GuessNumberScreen extends StatefulWidget {
  const GuessNumberScreen({super.key});

  @override
  State<GuessNumberScreen> createState() => _GuessNumberScreenState();
}

class _GuessNumberScreenState extends State<GuessNumberScreen> {
  final TextEditingController controller = TextEditingController();

  int target = Random().nextInt(50) + 1;
  String message = "1 se 50 ke beech number guess karo";

  bool gameOver = false;
  bool isDead = false;
  bool showGameOverPopup = false;

  int attemptsLeft = 5;
  int? lastGuess;

  // Banner
  late BannerAd _bannerAd;
  bool _isBannerLoaded = false;

  // Rewarded
  RewardedAd? _rewardedAd;
  bool _isRewardedLoaded = false;

  @override
  void initState() {
    super.initState();
    loadBanner();
    loadRewarded();
  }

  void loadBanner() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-9921766463937527/1591671153',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isBannerLoaded = true),
        onAdFailedToLoad: (ad, error) => ad.dispose(),
      ),
    )..load();
  }

  void loadRewarded() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/2208610648',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedLoaded = true;
        },
        onAdFailedToLoad: (_) => _isRewardedLoaded = false,
      ),
    );
  }

  void showRewardedRevive() {
    if (_rewardedAd == null) return;

    _rewardedAd!.show(
      onUserEarnedReward: (_, __) {
        setState(() {
          attemptsLeft = 3;
          isDead = false;
          showGameOverPopup = false;

          if (lastGuess != null) {
            if (lastGuess! < target) {
              message = "🔥 Revived! Bada number try karo";
            } else if (lastGuess! > target) {
              message = "🔥 Revived! Chhota number try karo";
            }
          } else {
            message = "🔥 Revived! 3 aur chances";
          }
        });
      },
    );

    _rewardedAd = null;
    loadRewarded();
  }

  void showRewardedBonus() {
    if (_rewardedAd == null) return;

    _rewardedAd!.show(
      onUserEarnedReward: (_, __) async {
        await CoinManager.addCoins(30);
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("🎁 +30 Bonus Coins")));
      },
    );

    _rewardedAd = null;
    loadRewarded();
  }

  void checkGuess() async {
    if (gameOver || isDead) return;

    final input = int.tryParse(controller.text);
    if (input == null) {
      setState(() => message = "Valid number daalo");
      return;
    }

    lastGuess = input;

    if (input == target) {
      await CoinManager.addCoins(20);
      setState(() {
        message = "🎉 Sahi jawab! +20 coins";
        gameOver = true;
      });
    } else {
      attemptsLeft--;

      if (attemptsLeft == 0) {
        setState(() {
          isDead = true;
          showGameOverPopup = true;
        });
      } else if (input < target) {
        setState(() => message = "Bada number try karo");
      } else {
        setState(() => message = "Chhota number try karo");
      }
    }
  }

  void resetGame() {
    target = Random().nextInt(50) + 1;
    attemptsLeft = 5;
    isDead = false;
    showGameOverPopup = false;
    lastGuess = null;
    controller.clear();
    setState(() {
      message = "1 se 50 ke beech number guess karo";
      gameOver = false;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _bannerAd.dispose();
    _rewardedAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guess the Number"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Text("🎯", style: TextStyle(fontSize: 18)),
                const SizedBox(width: 4),
                Text(
                  attemptsLeft.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          message,
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),

                        SizedBox(
                          width: 200,
                          child: TextField(
                            controller: controller,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            enabled: !isDead && !gameOver,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter number",
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: checkGuess,
                          child: const Text("CHECK"),
                        ),

                        const SizedBox(height: 10),

                        if (gameOver && _isRewardedLoaded)
                          ElevatedButton(
                            onPressed: showRewardedBonus,
                            child: const Text("Watch Ad & Get +30 Coins"),
                          ),

                        if (gameOver || isDead)
                          TextButton(
                            onPressed: resetGame,
                            child: const Text("Play Again"),
                          ),
                      ],
                    ),
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

            if (showGameOverPopup)
              Container(
                color: Colors.black.withOpacity(0.7),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "💀 Game Over",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Chances khatam ho gaye"),
                        const SizedBox(height: 20),

                        if (_isRewardedLoaded)
                          ElevatedButton(
                            onPressed: showRewardedRevive,
                            child: const Text("Revive (+3 Chances)"),
                          ),

                        const SizedBox(height: 10),

                        OutlinedButton(
                          onPressed: resetGame,
                          child: const Text("Play Again"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
