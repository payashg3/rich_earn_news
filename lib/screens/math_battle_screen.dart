import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/coin_manager.dart';

class MathBattleScreen extends StatefulWidget {
  const MathBattleScreen({super.key});

  @override
  State<MathBattleScreen> createState() => _MathBattleScreenState();
}

class _MathBattleScreenState extends State<MathBattleScreen> {
  int a = 0, b = 0, c = 0;
  String op = '+';
  int correctAnswer = 0;

  int questionNo = 1;
  int score = 0;
  int timeLeft = 7;

  String difficulty = "hard"; // easy | medium | hard
  String questionText = "";

  Timer? timer;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    generateQuestion();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    timeLeft = difficulty == "hard" ? 7 : 10;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        timeLeft--;
      });

      if (timeLeft == 0) {
        nextQuestion();
      }
    });
  }

  void generateQuestion() {
    final rand = Random();

    int min = 1;
    int max = 20;
    List<String> ops = ['+'];

    if (difficulty == "easy") {
      min = 1;
      max = 20;
      ops = ['+', '-', '*'];
    } else if (difficulty == "medium") {
      min = 10;
      max = 50;
      ops = ['+', '-', '*'];
    } else if (difficulty == "hard") {
      min = 20;
      max = 100;
      ops = ['+', '-', '*', '/'];
    }

    a = rand.nextInt(max - min + 1) + min;
    b = rand.nextInt(max - min + 1) + min;
    op = ops[rand.nextInt(ops.length)];

    // 20% chance for DOUBLE OPERATION in hard mode
    if (difficulty == "hard" && rand.nextInt(5) == 0) {
      c = rand.nextInt(10) + 2;
      correctAnswer = (a + b) * c;
      questionText = "($a + $b) × $c";
      return;
    }

    if (op == '/') {
      correctAnswer = rand.nextInt(10) + 2;
      b = rand.nextInt(9) + 2;
      a = correctAnswer * b;
      questionText = "$a ÷ $b";
    } else if (op == '+') {
      correctAnswer = a + b;
      questionText = "$a + $b";
    } else if (op == '-') {
      correctAnswer = a - b;
      questionText = "$a - $b";
    } else if (op == '*') {
      correctAnswer = a * b;
      questionText = "$a × $b";
    }
  }

  void submitAnswer() {
    final userAnswer = int.tryParse(controller.text);

    if (userAnswer == correctAnswer) {
      if (difficulty == "easy") score += 5;
      if (difficulty == "medium") score += 7;
      if (difficulty == "hard") score += 10;
    }

    nextQuestion();
  }

  void nextQuestion() async {
    controller.clear();
    timer?.cancel();

    if (questionNo == 10) {
      await CoinManager.addCoins(score);
      if (!mounted) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text("Game Over"),
          content: Text("You earned $score 🪙"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("OK"),
            )
          ],
        ),
      );
      return;
    }

    setState(() {
      questionNo++;
      generateQuestion();
      startTimer();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Math Battle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Question $questionNo / 10",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),

            Text(
              questionText,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "⏱️ $timeLeft sec",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Answer",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: submitAnswer,
              child: const Text("Submit"),
            ),

            const SizedBox(height: 20),

            Text(
              "Score: $score 🪙",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

