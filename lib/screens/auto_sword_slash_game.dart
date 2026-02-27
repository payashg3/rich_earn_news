import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AutoSwordSlashGame(),
    ),
  );
}

class AutoSwordSlashGame extends StatefulWidget {
  const AutoSwordSlashGame({super.key});

  @override
  State<AutoSwordSlashGame> createState() => _AutoSwordSlashGameState();
}

class _AutoSwordSlashGameState extends State<AutoSwordSlashGame> {
  String enemySide = "left"; // left or right
  double enemyPosition = -1;

  int score = 0;
  int lives = 3;
  bool gameOver = false;

  Timer? gameLoop;
  double speed = 0.02;

  @override
  void initState() {
    super.initState();
    spawnEnemy();
    startGame();
  }

  void spawnEnemy() {
    enemySide = Random().nextBool() ? "left" : "right";
    enemyPosition = -1;
  }

  void startGame() {
    gameLoop?.cancel();

    gameLoop = Timer.periodic(const Duration(milliseconds: 30), (_) {
      setState(() {
        enemyPosition += speed;

        if (enemyPosition > 0.8) {
          lives--;
          if (lives <= 0) {
            gameOver = true;
            gameLoop?.cancel();
          } else {
            spawnEnemy();
          }
        }
      });
    });
  }

  void handleSwipe(DragEndDetails details) {
    if (gameOver) return;

    double velocity = details.primaryVelocity ?? 0;

    String swipeDirection = velocity > 0 ? "right" : "left";

    if (swipeDirection == enemySide) {
      setState(() {
        score++;
        spawnEnemy();

        if (score % 5 == 0) {
          speed += 0.005;
        }
      });
    } else {
      setState(() {
        lives--;
        if (lives <= 0) {
          gameOver = true;
          gameLoop?.cancel();
        } else {
          spawnEnemy();
        }
      });
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onHorizontalDragEnd: handleSwipe,
        child: Stack(
          children: [
            // Enemy
            Align(
              alignment: Alignment(
                enemySide == "left" ? -0.8 : 0.8,
                enemyPosition,
              ),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
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

            // Lives
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
