import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TapShootGame extends StatefulWidget {
  const TapShootGame({super.key});

  @override
  State<TapShootGame> createState() => _TapShootGameState();
}

class _TapShootGameState extends State<TapShootGame> {
  double playerX = 0;

  List<_FallingObject> objects = [];
  List<double> bullets = [];
  List<_Explosion> explosions = [];

  int score = 0;
  bool gameOver = false;
  bool doubleGun = false;

  Timer? gameLoop;
  Timer? fireLoop;

  final Random random = Random();
  double enemySpeed = 0.02;

  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _loadAd();
    startGame();
  }

  void _loadAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/2271514778',
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
    fireLoop?.cancel();

    objects.clear();
    bullets.clear();
    explosions.clear();
    score = 0;
    gameOver = false;
    enemySpeed = 0.02;
    doubleGun = false;

    fireLoop = Timer.periodic(const Duration(milliseconds: 300), (_) {
      if (!gameOver && bullets.length < 10) {
        bullets.add(0.8);
        if (doubleGun) bullets.add(0.75);
      }
    });

    gameLoop = Timer.periodic(const Duration(milliseconds: 30), (_) {
      if (gameOver) return;

      setState(() {
        if (objects.length < 7 && random.nextDouble() < 0.03) {
          objects.add(
            _FallingObject(
              x: random.nextDouble() * 2 - 1,
              y: -1,
              type: _randomType(),
            ),
          );
        }

        // Move objects
        for (var obj in objects) {
          if (obj.type == "enemy" && obj.isFrozen) continue;
          obj.y += enemySpeed;
        }

        // Move bullets
        for (int i = bullets.length - 1; i >= 0; i--) {
          bullets[i] -= 0.05;
          if (bullets[i] < -1) bullets.removeAt(i);
        }

        // Collision
        for (int i = objects.length - 1; i >= 0; i--) {
          final obj = objects[i];

          // Catch detection
          if ((obj.y - 0.9).abs() < 0.1 && (obj.x - playerX).abs() < 0.2) {
            handleCatch(obj);
            continue;
          }

          // Bullet collision (enemy only)
          if (obj.type == "enemy") {
            for (int j = bullets.length - 1; j >= 0; j--) {
              if ((obj.y - bullets[j]).abs() < 0.1 &&
                  (obj.x - playerX).abs() < 0.2) {
                score++;
                explosions.add(_Explosion(obj.x, obj.y));
                objects.removeAt(i);
                bullets.removeAt(j);
                break;
              }
            }
          }

          if (obj.y > 1) objects.removeAt(i);
        }

        // Animate explosions
        explosions.removeWhere((e) => e.size > 40);
        for (var e in explosions) {
          e.size += 2;
        }
      });
    });
  }

  String _randomType() {
    double r = random.nextDouble();
    if (r < 0.7) return "enemy";
    if (r < 0.85) return "double";
    if (r < 0.95) return "freeze";
    return "bomb";
  }

  void handleCatch(_FallingObject obj) {
    if (obj.type == "double") {
      doubleGun = true;
      Future.delayed(const Duration(seconds: 5), () => doubleGun = false);
    } else if (obj.type == "freeze") {
      // Freeze only currently visible enemies
      for (var o in objects) {
        if (o.type == "enemy") {
          o.isFrozen = true;
        }
      }

      Future.delayed(const Duration(seconds: 5), () {
        for (var o in objects) {
          o.isFrozen = false;
        }
      });
    } else if (obj.type == "bomb") {
      explosions.add(_Explosion(playerX, 0.9));
      gameOver = true;
      _showAd();
    }

    objects.remove(obj);
  }

  void restartGame() {
    setState(() {
      startGame();
    });
  }

  @override
  void dispose() {
    gameLoop?.cancel();
    fireLoop?.cancel();
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
            Align(
              alignment: Alignment(playerX, 0.9),
              child: Container(width: 50, height: 30, color: Colors.blue),
            ),

            ...objects.map((obj) {
              String emoji = obj.type == "enemy"
                  ? (obj.isFrozen ? "🧊" : "👾")
                  : obj.type == "double"
                  ? "⚡"
                  : obj.type == "freeze"
                  ? "❄️"
                  : "💣";

              return Align(
                alignment: Alignment(obj.x, obj.y),
                child: Text(emoji, style: const TextStyle(fontSize: 30)),
              );
            }),

            ...bullets.map(
              (b) => Align(
                alignment: Alignment(playerX, b),
                child: const Icon(Icons.circle, size: 8, color: Colors.yellow),
              ),
            ),

            ...explosions.map(
              (e) => Align(
                alignment: Alignment(e.x, e.y),
                child: Container(
                  width: e.size,
                  height: e.size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange.withOpacity(0.6),
                  ),
                ),
              ),
            ),

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
                child: ElevatedButton(
                  onPressed: restartGame,
                  child: const Text("Restart"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FallingObject {
  double x;
  double y;
  String type;
  bool isFrozen = false;

  _FallingObject({required this.x, required this.y, required this.type});
}

class _Explosion {
  double x;
  double y;
  double size = 10;

  _Explosion(this.x, this.y);
}
