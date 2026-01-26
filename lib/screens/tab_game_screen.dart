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

  @override
  void initState() {
    super.initState();
    loadBanner();
  }

  void loadBanner() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // TEST
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

  void startGame() {
    taps = 0;
    timeLeft = 10;
    isRunning = true;

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft == 0) {
        endGame();
      } else {
        setState(() {
          timeLeft--;
        });
      }
    });

    setState(() {});
  }

  void endGame() async {
    timer?.cancel();
    isRunning = false;

    await CoinManager.addCoins(taps);

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Game Over"),
        content: Text("You earned $taps coins 🪙"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );

    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel();
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tap Challenge")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox.expand(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Time Left: $timeLeft",
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
                          onTap: isRunning
                              ? () {
                                  setState(() {
                                    taps++;
                                  });
                                }
                              : null,
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
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: isRunning ? null : startGame,
                          child: const Text("START"),
                        ),
                      ],
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
