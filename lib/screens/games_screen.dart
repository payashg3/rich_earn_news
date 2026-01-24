import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/coin_manager.dart';
import 'web_games_screen.dart';
import 'spin_game_screen.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  Future<void> addCoins(int value, BuildContext context) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      "coins": FieldValue.increment(value),
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("+$value Coins added 🪙")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Games")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            gameCard(
              context,
              icon: Icons.public,
              title: "Online Games",
              subtitle: "100+ games",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => WebGamesScreen()),
                );
              },
            ),

            gameCard(
              context,
              icon: Icons.casino,
              title: "Spin & Win",
              subtitle: "Try your luck",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SpinGameScreen()),
                );
              },
            ),
            gameCard(
              context,
              icon: Icons.quiz,
              title: "Quiz",
              subtitle: "Answer & win",
              onTap: () async {
                if (await CoinManager.canAdd(15)) {
                  await CoinManager.add(15);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("+15 Coins 🪙")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Daily limit reached")),
                  );
                }
              },
            ),

            gameCard(
              context,
              icon: Icons.card_giftcard,
              title: "Scratch Card",
              subtitle: "Try your luck",
              onTap: () async {
                if (await CoinManager.canAdd(20)) {
                  await CoinManager.add(20);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("+20 Coins 🪙")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Daily limit reached")),
                  );
                }
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
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.deepPurple),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(subtitle, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
