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

  int attemptsLeft = 5;

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
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
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

  void loadRewarded() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
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

  void showRewardedRevive() {
    if (_rewardedAd == null) return;

    _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) {
        setState(() {
          attemptsLeft = 3;
          isDead = false;
          message = "🔥 Revived! 3 aur chances";
        });
      },
    );

    _rewardedAd = null;
    loadRewarded();
  }

  void showRewardedBonus() {
    if (_rewardedAd == null) return;

    _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) async {
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
          message = "💀 Game Over! Chances khatam";
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
            child: Center(
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
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
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

                    if (isDead && _isRewardedLoaded)
                      ElevatedButton(
                        onPressed: showRewardedRevive,
                        child: const Text("Revive (Watch Ad)"),
                      ),

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
