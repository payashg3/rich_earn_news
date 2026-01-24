import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/coin_manager.dart';

class SpinGameScreen extends StatefulWidget {
  const SpinGameScreen({super.key});

  @override
  State<SpinGameScreen> createState() => _SpinGameScreenState();
}

class _SpinGameScreenState extends State<SpinGameScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final rewards = [5, 10, 15, 20, 25, 50];
  int? result;
  bool spinning = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  void spin() async {
    if (spinning) return;
    setState(() {
      spinning = true;
      result = null;
    });

    final random = Random();
    final reward = rewards[random.nextInt(rewards.length)];

    _controller.reset();
    _controller.forward();

    await Future.delayed(Duration(seconds: 3));

    if (await CoinManager.canAdd(reward)) {
      await CoinManager.add(reward);
      setState(() {
        result = reward;
      });
    } else {
      setState(() {
        result = -1;
      });
    }

    spinning = false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Spin & Win")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _animation,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [
                      Colors.red,
                      Colors.orange,
                      Colors.yellow,
                      Colors.green,
                      Colors.blue,
                      Colors.purple,
                      Colors.red,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "SPIN",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: spin,
              child: Text(spinning ? "Spinning..." : "Spin Now"),
            ),
            SizedBox(height: 20),
            if (result != null)
              result == -1
                  ? Text(
                      "Daily limit reached 😬",
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    )
                  : Text(
                      "You won $result coins 🪙",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
