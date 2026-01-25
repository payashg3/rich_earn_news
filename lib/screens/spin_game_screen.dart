import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import '../utils/coin_manager.dart';

class SpinGameScreen extends StatefulWidget {
  const SpinGameScreen({super.key});

  @override
  State<SpinGameScreen> createState() => _SpinGameScreenState();
}

class _SpinGameScreenState extends State<SpinGameScreen> {
  late StreamController<int> controller;

  final List<int> rewards = [5, 10, 20, 50, 100, 200];

  int selected = 0;
  int totalCoins = 0;
  int spinsToday = 0;
  final int dailyLimit = 5;
  int lastIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = StreamController<int>();
    loadCoins();
  }

  Future<void> loadCoins() async {
    final coins = await CoinManager.getCoins();
    if (!mounted) return;
    setState(() {
      totalCoins = coins;
    });
  }

  void spin() {
    if (spinsToday >= dailyLimit) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Daily limit reached")));
      return;
    }

    final index = Fortune.randomInt(0, rewards.length);
    lastIndex = index;
    controller.add(index);
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Spin & Win")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Coins: $totalCoins 🪙",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text("Spins left: ${dailyLimit - spinsToday}"),
          const SizedBox(height: 20),

          SizedBox(
            height: 300,
            child: FortuneWheel(
              selected: controller.stream,
              indicators: const [
                FortuneIndicator(
                  alignment: Alignment.topCenter,
                  child: TriangleIndicator(color: Colors.red),
                ),
              ],
              items: [
                for (var reward in rewards)
                  FortuneItem(
                    child: Text(
                      reward.toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
              onAnimationEnd: () async {
                final win = rewards[lastIndex];
                await CoinManager.addCoins(win);

                if (!mounted) return;
                setState(() {
                  selected = win;
                  spinsToday++;
                  totalCoins += win;
                });
              },
            ),
          ),

          const SizedBox(height: 20),
          Text("Last win: $selected", style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: spin, child: const Text("SPIN")),
        ],
      ),
    );
  }
}
