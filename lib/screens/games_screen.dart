import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/coin_manager.dart';
import 'spin_game_screen.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  int coins = -1; // -1 means "abhi load hi nahi hua"

  @override
  void initState() {
    super.initState();
    loadCoins();
  }

  void loadCoins() async {
    final c = await CoinManager.getCoins();
    print("GAMES SCREEN COINS => $c"); // terminal proof
    if (!mounted) return;
    setState(() {
      coins = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RichEarn Games"),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                coins == -1 ? "लोड हो रहा..." : "$coins 🪙",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),
        ],
      ),

      body: SafeArea(
        child: ListView(
          children: [
            gameCard(
              context,
              icon: Icons.casino,
              title: "Spin & Win",
              subtitle: "Spin the wheel",
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SpinGameScreen()),
                );
                loadCoins(); // BACK aate hi refresh
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget gameCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
