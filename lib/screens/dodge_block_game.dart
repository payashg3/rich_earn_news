import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DodgeBlocksGame(),
    ),
  );
}

class DodgeBlocksGame extends StatefulWidget {
  const DodgeBlocksGame({super.key});

  @override
  State<DodgeBlocksGame> createState() => _DodgeBlocksGameState();
}

class _DodgeBlocksGameState extends State<DodgeBlocksGame> {
  double playerX = 0;
  List<_Block> blocks = [];

  Timer? gameLoop;
  Timer? spawnLoop;

  double speed = 0.015;
  int score = 0;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    gameLoop?.cancel();
    spawnLoop?.cancel();

    blocks.clear();
    speed = 0.015;
    score = 0;
    gameOver = false;

    // Spawn blocks
    spawnLoop = Timer.periodic(const Duration(milliseconds: 800), (_) {
      if (!gameOver) {
        blocks.add(_Block(x: Random().nextDouble() * 2 - 1, y: -1));
      }
    });

    // Game loop
    gameLoop = Timer.periodic(const Duration(milliseconds: 30), (_) {
      setState(() {
        for (var block in blocks) {
          block.y += speed;
        }

        // Remove off screen blocks
        blocks.removeWhere((block) => block.y > 1);

        // Collision detection
        for (var block in blocks) {
          if ((block.y - 0.9).abs() < 0.1 && (block.x - playerX).abs() < 0.2) {
            gameOver = true;
            gameLoop?.cancel();
            spawnLoop?.cancel();
          }
        }

        // Increase difficulty gradually
        score++;
        if (score % 200 == 0) {
          speed += 0.002;
        }
      });
    });
  }

  void resetGame() {
    startGame();
  }

  @override
  void dispose() {
    gameLoop?.cancel();
    spawnLoop?.cancel();
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

            // Blocks
            ...blocks.map(
              (block) => Align(
                alignment: Alignment(block.x, block.y),
                child: Container(width: 40, height: 40, color: Colors.red),
              ),
            ),

            // Score
            Positioned(
              top: 60,
              left: 20,
              child: Text(
                "Time: ${score ~/ 30}s",
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
                      "Survived: ${score ~/ 30} sec",
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

class _Block {
  double x;
  double y;

  _Block({required this.x, required this.y});
}
