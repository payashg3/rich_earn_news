import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AutoSwordSlashGame extends StatefulWidget {
  const AutoSwordSlashGame({super.key});

  @override
  State<AutoSwordSlashGame> createState() => _AutoSwordSlashGameState();
}

class _AutoSwordSlashGameState extends State<AutoSwordSlashGame>
    with SingleTickerProviderStateMixin {
  String enemySide = "left";
  double enemyPosition = -1;
  String enemyType = "enemy";

  int score = 0;
  int lives = 3;
  bool gameOver = false;

  double speed = 0.02;
  Timer? gameLoop;

  InterstitialAd? _interstitialAd;

  bool showSlash = false;
  String slashSide = "left";

  @override
  void initState() {
    super.initState();
    _loadAd();
    spawnEnemy();
    startGame();
  }

  void _loadAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/1949390659',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (_) {},
      ),
    );
  }

  void _showAd() {
    _interstitialAd?.show();
    _interstitialAd?.dispose();
    _loadAd();
  }

  void spawnEnemy() {
    enemySide = Random().nextBool() ? "left" : "right";
    enemyPosition = -1;
    enemyType = Random().nextDouble() < 0.2 ? "bomb" : "enemy";
  }

  void startGame() {
    gameLoop?.cancel();

    gameLoop = Timer.periodic(const Duration(milliseconds: 30), (_) {
      if (gameOver) return;

      setState(() {
        enemyPosition += speed;

        if (enemyPosition > 0.85) {
          if (enemyType == "enemy") {
            lives--;
          }
          spawnEnemy();

          if (lives <= 0) {
            gameOver = true;
            gameLoop?.cancel();
            _showAd();
          }
        }

        if (score != 0 && score % 5 == 0) {
          speed += 0.0005;
        }
      });
    });
  }

  void handleTap(TapUpDetails details) {
    if (gameOver) return;

    double tapX = details.localPosition.dx;
    double screenWidth = MediaQuery.of(context).size.width;
    String tapSide = tapX < screenWidth / 2 ? "left" : "right";

    setState(() {
      showSlash = true;
      slashSide = tapSide;
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        showSlash = false;
      });
    });

    if (tapSide == enemySide) {
      if (enemyType == "enemy") {
        score++;
      } else {
        lives--;
      }

      spawnEnemy();

      if (lives <= 0) {
        gameOver = true;
        gameLoop?.cancel();
        _showAd();
      }
    }
  }

  void resetGame() {
    setState(() {
      score = 0;
      lives = 3;
      speed = 0.02;
      gameOver = false;
      spawnEnemy();
    });

    startGame();
  }

  @override
  void dispose() {
    gameLoop?.cancel();
    _interstitialAd?.dispose();
    super.dispose();
  }

  Widget buildSlashEffect() {
    return Align(
      alignment: Alignment(slashSide == "left" ? -0.8 : 0.8, 0.7),
      child: Transform.rotate(
        angle: -0.7,
        child: Container(
          width: 120,
          height: 8,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.white, Colors.redAccent],
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapUp: handleTap,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(
                enemySide == "left" ? -0.8 : 0.8,
                enemyPosition,
              ),
              child: Text(
                enemyType == "enemy" ? "👹" : "💣",
                style: const TextStyle(fontSize: 50),
              ),
            ),

            if (showSlash) buildSlashEffect(),

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

            Positioned(
              top: 60,
              right: 20,
              child: Text(
                "Lives: $lives",
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
