import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/coin_manager.dart';

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

  void checkGuess() async {
    if (gameOver) return;

    final input = int.tryParse(controller.text);
    if (input == null) {
      setState(() {
        message = "Valid number daalo";
      });
      return;
    }

    if (input == target) {
      await CoinManager.addCoins(20);
      setState(() {
        message = "🎉 Sahi jawab! +20 coins";
        gameOver = true;
      });
    } else if (input < target) {
      setState(() {
        message = "Bada number try karo";
      });
    } else {
      setState(() {
        message = "Chhota number try karo";
      });
    }
  }

  void resetGame() {
    target = Random().nextInt(50) + 1;
    controller.clear();
    setState(() {
      message = "1 se 50 ke beech number guess karo";
      gameOver = false;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Guess the Number")),
      body: SafeArea(
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter number",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(onPressed: checkGuess, child: const Text("CHECK")),

              const SizedBox(height: 10),

              if (gameOver)
                TextButton(
                  onPressed: resetGame,
                  child: const Text("Play Again"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
