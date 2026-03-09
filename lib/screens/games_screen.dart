import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/coin_manager.dart';

import 'spin_game_screen.dart';
import 'scratch_and_win_game_screen.dart';
import 'guess_number_screen.dart';
import 'math_battle_screen.dart';
import 'login_screen.dart';
import 'color_mix_game_screen.dart';
import 'pattern_match_screen.dart';
import 'tab_shoot_game.dart';
import 'dodge_block_game.dart';
import 'auto_sword_slash_game.dart';
import 'tab_game_screen.dart';
import 'wallet_screen.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen>
    with SingleTickerProviderStateMixin {
  int coins = -1;

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    loadCoins();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  void loadCoins() async {
    final c = await CoinManager.getCoins();
    if (!mounted) return;
    setState(() {
      coins = c;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void openWallet() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const WalletScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              children: [
                // 🔥 Top Bar
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "RichEarn Games",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: openWallet,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                coins == -1 ? "..." : "$coins 🪙",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.logout, color: Colors.white),
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 🎮 Games List
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      buildGameCard(
                        Icons.casino,
                        "Spin & Win",
                        "Spin the wheel",
                        const SpinGameScreen(),
                      ),
                      buildGameCard(
                        Icons.card_giftcard,
                        "Scratch & Win",
                        "Scratch the card",
                        const ScratchGameScreen(),
                      ),
                      buildGameCard(
                        Icons.psychology,
                        "Pattern Panic",
                        "Test your memory",
                        const PatternMatchScreen(),
                      ),
                      buildGameCard(
                        Icons.calculate,
                        "Math Battle",
                        "Fast math quiz",
                        const MathBattleScreen(),
                      ),
                      buildGameCard(
                        Icons.color_lens,
                        "Color Mix",
                        "Create new colors",
                        const ColorMixGameScreen(),
                      ),
                      buildGameCard(
                        Icons.flash_on,
                        "Tap Challenge",
                        "10 sec me jitna tap ho sake",
                        const TapGameScreen(),
                      ),
                      buildGameCard(
                        Icons.pin,
                        "Number Guess",
                        "Guess 1-50 number",
                        const GuessNumberScreen(),
                      ),
                      buildGameCard(
                        Icons.gps_fixed,
                        "Shoot the Enemy",
                        "Auto fire shooting",
                        TapShootGame(),
                      ),
                      buildGameCard(
                        Icons.grid_on,
                        "Dodge the Blocks",
                        "Avoid falling blocks",
                        const DodgeBlocksGame(),
                      ),
                      buildGameCard(
                        Icons.sports_martial_arts,
                        "Auto Sword Slash",
                        "Swipe to slash enemies",
                        const AutoSwordSlashGame(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGameCard(
    IconData icon,
    String title,
    String subtitle,
    Widget screen,
  ) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
        loadCoins();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.amber),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(subtitle, style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white70,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
