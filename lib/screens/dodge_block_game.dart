import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DodgeBlocksGame extends StatefulWidget {
  const DodgeBlocksGame({super.key});

  @override
  State<DodgeBlocksGame> createState() => _DodgeBlocksGameState();
}

class _DodgeBlocksGameState extends State<DodgeBlocksGame> {
  double playerX = 0;
  double playerWidth = 60;

  List<_FallingItem> items = [];

  Timer? gameLoop;
  Timer? spawnLoop;

  double speed = 0.015;
  int score = 0;
  bool gameOver = false;
  bool invincible = false;

  InterstitialAd? _interstitialAd;

  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _loadAd();
    startGame();
  }

  void _loadAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/8964915639',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  void _showAd() {
    _interstitialAd?.show();
    _interstitialAd?.dispose();
    _loadAd();
  }

  void startGame() {
    gameLoop?.cancel();
    spawnLoop?.cancel();

    items.clear();
    speed = 0.015;
    score = 0;
    gameOver = false;
    invincible = false;
    playerWidth = 60;

    spawnLoop = Timer.periodic(const Duration(milliseconds: 700), (_) {
      if (!gameOver) {
        items.add(
          _FallingItem(
            x: random.nextDouble() * 2 - 1,
            y: -1,
            type: _randomType(),
          ),
        );
      }
    });

    gameLoop = Timer.periodic(const Duration(milliseconds: 30), (_) {
      if (gameOver) return;

      setState(() {
        for (int i = items.length - 1; i >= 0; i--) {
          final item = items[i];

          item.y += speed;

          // Collision
          if ((item.y - 0.9).abs() < 0.1 &&
              (item.x - playerX).abs() < (playerWidth / 200)) {
            handleCollision(item);
            items.removeAt(i);
            continue;
          }

          // Successful Dodge
          if (item.y > 1) {
            if (item.type == "block") {
              score++; // ✅ score only when block dodged
            }
            items.removeAt(i);
          }
        }

        // Gradual difficulty
        if (score != 0 && score % 10 == 0) {
          speed += 0.001;
        }
      });
    });
  }

  String _randomType() {
    double r = random.nextDouble();
    if (r < 0.65) return "block";
    if (r < 0.75) return "slow";
    if (r < 0.85) return "fast";
    if (r < 0.92) return "invincible";
    if (r < 0.96) return "big";
    return "small";
  }

  void handleCollision(_FallingItem item) {
    if (item.type == "block") {
      if (!invincible) {
        gameOver = true;
        _showAd();
      }
    } else if (item.type == "slow") {
      speed *= 0.5;
      Future.delayed(const Duration(seconds: 5), () {
        speed = 0.02;
      });
    } else if (item.type == "fast") {
      speed *= 1.8;
      Future.delayed(const Duration(seconds: 5), () {
        speed = 0.02;
      });
    } else if (item.type == "invincible") {
      invincible = true;
      Future.delayed(const Duration(seconds: 5), () {
        invincible = false;
      });
    } else if (item.type == "big") {
      playerWidth = 100;
      Future.delayed(const Duration(seconds: 5), () {
        playerWidth = 60;
      });
    } else if (item.type == "small") {
      playerWidth = 35;
      Future.delayed(const Duration(seconds: 5), () {
        playerWidth = 60;
      });
    }
  }

  void resetGame() {
    startGame();
  }

  @override
  void dispose() {
    gameLoop?.cancel();
    spawnLoop?.cancel();
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 123, 98),
        elevation: 0,
        toolbarHeight: 35,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            gameLoop?.cancel();   // stop game loop
            Navigator.pop(context); // go back
          },
        ),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            playerX += details.delta.dx / MediaQuery.of(context).size.width * 2;
            playerX = playerX.clamp(-1, 1);
          });
        },
        child: Stack(
          children: [
            // Roller Player
            Align(
              alignment: Alignment(playerX, 0.9),
              child: Container(
                width: playerWidth,
                height: 25,
                decoration: BoxDecoration(
                  color: invincible ? Colors.yellow : Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            // Falling Items
            ...items.map((item) {
              String emoji = item.type == "block"
                  ? "🟥"
                  : item.type == "slow"
                  ? "🐢"
                  : item.type == "fast"
                  ? "⚡"
                  : item.type == "invincible"
                  ? "🛡"
                  : item.type == "big"
                  ? "⬆️"
                  : "⬇️";

              return Align(
                alignment: Alignment(item.x, item.y),
                child: Text(emoji, style: const TextStyle(fontSize: 28)),
              );
            }),

            // Score
            Positioned(
              top: 60,
              left: 20,
              child: Text(
                "Score: $score",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            if (gameOver)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "GAME OVER",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Final Score: $score",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: resetGame,
                      child: const Text("Restart"),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FallingItem {
  double x;
  double y;
  String type;

  _FallingItem({required this.x, required this.y, required this.type});
}
