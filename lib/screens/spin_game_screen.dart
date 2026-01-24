import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/coin_manager.dart';

class SpinGameScreen extends StatefulWidget {
  @override
  State<SpinGameScreen> createState() => _SpinGameScreenState();
}

class _SpinGameScreenState extends State<SpinGameScreen> {
  List<int> rewards = [5, 10, 20, 50, 100];
  int selected = 0;
  bool spinning = false;

  void spin() async {
    if (spinning) return;

    setState(() {
      spinning = true;
    });

    await Future.delayed(Duration(seconds: 2));

    final random = Random();
    selected = rewards[random.nextInt(rewards.length)];

    if (!mounted) return;
    setState(() {
      spinning = false;
    });

    if (await CoinManager.canAdd(selected)) {
      await CoinManager.add(selected);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("You won $selected coins 🪙")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Daily limit reached ⛔")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Spin & Win")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Reward: $selected",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: spin,
            child: spinning
                ? CircularProgressIndicator(color: Colors.white)
                : Text("SPIN"),
          ),
        ],
      ),
    );
  }
}
