import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: TapShootGame()),
  );
}

class TapShootGame extends StatefulWidget {
  const TapShootGame({super.key});

  @override
  State<TapShootGame> createState() => _TapShootGameState();
}

class _TapShootGameState extends State<TapShootGame> {
  double playerX = 0;
  double enemyX = 0;
  double enemyY = -1;

  List<double> bullets = [];

  int score = 0;
  bool gameOver = false;

  Timer? gameLoop;
  Timer? fireLoop;

  double enemySpeed = 0.02;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    gameLoop?.cancel();
    fireLoop?.cancel();

    enemyX = Random().nextDouble() * 2 - 1;
    enemyY = -1;

    // Auto Fire every 300ms
    fireLoop = Timer.periodic(const Duration(milliseconds: 300), (_) {
      if (!gameOver) {
        bullets.add(0.8);
      }
    });

    gameLoop = Timer.periodic(const Duration(milliseconds: 30), (_) {
      setState(() {
        enemyY += enemySpeed;

        // Move bullets
        for (int i = 0; i < bullets.length; i++) {
          bullets[i] -= 0.05;
        }

        bullets.removeWhere((b) => b < -1);

        // Collision check
        bullets.removeWhere((bulletY) {
          if ((enemyY - bulletY).abs() < 0.1 &&
              (enemyX - playerX).abs() < 0.2) {
            score++;
            enemyY = -1;
            enemyX = Random().nextDouble() * 2 - 1;

            if (score % 5 == 0) {
              enemySpeed += 0.005;
            }

            return true;
          }
          return false;
        });

        if (enemyY > 1) {
          gameOver = true;
          gameLoop?.cancel();
          fireLoop?.cancel();
        }
      });
    });
  }

  void resetGame() {
    setState(() {
      score = 0;
      gameOver = false;
      enemySpeed = 0.02;
      bullets.clear();
    });

    startGame();
  }

  @override
  void dispose() {
    gameLoop?.cancel();
    fireLoop?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            playerX += details.delta.dx / MediaQuery.of(context).size.width * 2;

            if (playerX > 1) playerX = 1;
            if (playerX < -1) playerX = -1;
          });
        },
        child: Stack(
          children: [
            // Player
            Align(
              alignment: Alignment(playerX, 0.9),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            // Enemy
            Align(
              alignment: Alignment(enemyX, enemyY),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),

            // Bullets
            ...bullets.map(
              (bulletY) => Align(
                alignment: Alignment(playerX, bulletY),
                child: Container(width: 6, height: 18, color: Colors.yellow),
              ),
            ),

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
