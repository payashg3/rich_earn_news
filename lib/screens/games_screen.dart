import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
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
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              coins == -1 ? "..." : "$coins 🪙",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.logout,
                                color: Colors.white),
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen()),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),

                // 🎮 Games List
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      buildGameCard(Icons.casino, "Spin & Win",
                          "Spin the wheel", const SpinGameScreen()),
                      buildGameCard(Icons.card_giftcard, "Scratch & Win",
                          "Scratch the card", const ScratchGameScreen()),
                      buildGameCard(Icons.psychology, "Pattern Panic",
                          "Test your memory", const PatternMatchScreen()),
                      buildGameCard(Icons.calculate, "Math Battle",
                          "Fast math quiz", const MathBattleScreen()),
                      buildGameCard(Icons.color_lens, "Color Mix",
                          "Create new colors", const ColorMixGameScreen()),
                      buildGameCard(Icons.pin, "Number Guess",
                          "Guess 1-50 number", const GuessNumberScreen()),
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
      IconData icon, String title, String subtitle, Widget screen) {
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
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 5),
                  Text(subtitle,
                      style: const TextStyle(color: Colors.white70)),
                  gameCard(
                    context,
                    icon: Icons.casino,
                    title: "Spin & Win",
                    subtitle: "Spin the wheel",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SpinGameScreen(),
                        ),
                      );
                      loadCoins();
                    },
                  ),
                  gameCard(
                    context,
                    icon: Icons.card_giftcard,
                    title: "Scratch & Win",
                    subtitle: "Scratch the Card",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ScratchGameScreen(),
                        ),
                      );
                      loadCoins();
                    },
                  ),
                  // gameCard(
                  //   context,
                  //   icon: Icons.ondemand_video,
                  //   title: "Watch Ad",
                  //   subtitle: "Earn Rewards",
                  //   onTap: () {
                  //     // yahan baad me rewarded ad lagaenge
                  //   },
                  // ),
                  gameCard(
                    context,
                    icon: Icons.psychology,
                    title: "Pattern Panic",
                    subtitle: "Can your brain keep up?",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PatternMatchScreen(),
                        ),
                      );
                      loadCoins();
                    },
                  ),
                  gameCard(
                    context,
                    icon: Icons.calculate,
                    title: "Math Battle",
                    subtitle: "Fast math questions",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MathBattleScreen(),
                        ),
                      );
                      loadCoins();
                    },
                  ),
                  gameCard(
                    context,
                    icon: Icons.color_lens,
                    title: "Color Mix",
                    subtitle: "Colors mix karke naya banao",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ColorMixGameScreen(),
                        ),
                      );
                      loadCoins();
                    },
                  ),
                  gameCard(
                    context,
                    icon: Icons.flash_on,
                    title: "Tap Challenge",
                    subtitle: "10 sec me jitna tap ho sake",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TapGameScreen(),
                        ),
                      );
                      loadCoins();
                    },
                  ),
                  gameCard(
                    context,
                    icon: Icons.pin,
                    title: "Number Guess",
                    subtitle: "1–50 number guess karo",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const GuessNumberScreen(),
                        ),
                      );
                      loadCoins();
                    },
                  ),
                  gameCard(
                    context,
                    icon: Icons.pin,
                    title: "Shoot the Enemy",
                    subtitle: "Shoot in 1 fire",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => TapShootGame()),
                      );
                      loadCoins();
                    },
                  ),
                  gameCard(
                    context,
                    icon: Icons.pin,
                    title: "Dogde the Blocks",
                    subtitle: "Avoid falling blocks",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DodgeBlocksGame(),
                        ),
                      );
                      loadCoins();
                    },
                  ),
                  gameCard(
                    context,
                    icon: Icons.pin,
                    title: "Auto Sword Slash",
                    subtitle: "Swipe to slash enemies",
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AutoSwordSlashGame(),
                        ),
                      );
                      loadCoins();
                    },
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                color: Colors.white70, size: 18)
          ],
        ),
      ),
    );
  }
}