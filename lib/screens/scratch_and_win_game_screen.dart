import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'package:confetti/confetti.dart';
import '../utils/coin_manager.dart';

class ScratchGameScreen extends StatefulWidget {
  const ScratchGameScreen({super.key});

  @override
  State<ScratchGameScreen> createState() => _ScratchGameScreenState();
}

class _ScratchGameScreenState extends State<ScratchGameScreen>
    with TickerProviderStateMixin {
  final List<int> rewards = [5, 10, 15, 20, 25, 50];
  final ConfettiController _confettiController = ConfettiController(
    duration: const Duration(seconds: 2),
  );

  int reward = 0;
  int totalCoins = 0;
  bool scratched = false;
  late AnimationController _pulseController;
  Key scratchKey = UniqueKey();

  // 🧊 COLD COLORS
  static const Color primaryBlue = Color(0xFF1E3A8A);
  static const Color accentPurple = Color(0xFF7C3AED);
  static const Color silver = Color(0xFFE2E8F0);
  static const Color glass = Color(0x40FFFFFF);
  static const Color darkScratch = Color(0xFF2D1B69); // ✅ DARK SCRATCH LAYER

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _newGame();
    _loadCoins();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _newGame() {
    reward = rewards[Random().nextInt(rewards.length)];
    scratched = false;
    scratchKey = UniqueKey();
  }

  Future<void> _loadCoins() async {
    totalCoins = await CoinManager.getCoins();
    if (mounted) setState(() {});
  }

  Future<void> _onScratchComplete() async {
    if (scratched) return;

    await CoinManager.addCoins(reward);

    setState(() {
      scratched = true;
      totalCoins += reward;
    });

    // ✨ Celebration
    _pulseController.repeat(reverse: true);
    _confettiController.play();

    if (mounted) {
      _showElegantDialog();
    }
  }

  void _showElegantDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ElegantDialog(
        reward: reward,
        accentPurple: accentPurple,
        glass: glass,
        onAutoNewGame: _autoNewGame,
      ),
    );
  }

  void _autoNewGame() {
    _confettiController.stop();
    _pulseController.stop();
    setState(() {
      _newGame(); // ✅ Auto random new card
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      appBar: AppBar(
        title: const Text(
          "Scratch & Win",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: pi / 2,
            emissionFrequency: 0.03,
            numberOfParticles: 20,
            gravity: 0.05,
            colors: [accentPurple, silver, Colors.blue.shade300],
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Coins display
                  Text(
                    "Coins: $totalCoins 🪙",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ✅ ANIMATED SCRATCH CARD - DARK SCRATCH LAYER
                  AnimatedBuilder(
                    animation: _pulseController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 1.0 + (_pulseController.value * 0.08),
                        child: Container(
                          height: 160,
                          width: 270,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: accentPurple.withOpacity(0.4),
                                blurRadius: 25,
                                offset: const Offset(0, 12),
                              ),
                            ],
                          ),
                          child: Scratcher(
                            key: scratchKey,
                            brushSize: 30,
                            threshold: 45,
                            // ✅ COMPLETELY DARK & OPAQUE SCRATCH LAYER
                            color: darkScratch,
                            onThreshold: _onScratchComplete,
                            child: GlassCard(reward: reward, glass: glass),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final int reward;
  final Color glass;

  const GlassCard({super.key, required this.reward, required this.glass});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            glass,
            Colors.white.withOpacity(0.2),
            Colors.blue.withOpacity(0.15),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.monetization_on, size: 36, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            "$reward",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
          Text(
            "COINS",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class ElegantDialog extends StatelessWidget {
  final int reward;
  final Color accentPurple;
  final Color glass;
  final VoidCallback onAutoNewGame;

  const ElegantDialog({
    super.key,
    required this.reward,
    required this.accentPurple,
    required this.glass,
    required this.onAutoNewGame,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      onAutoNewGame(); // Auto new random card
    });

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(40),
      child: Container(
        height: 260,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [glass, Colors.white.withOpacity(0.25)],
          ),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: accentPurple.withOpacity(0.4),
              blurRadius: 40,
              spreadRadius: 8,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.celebration, size: 64, color: accentPurple),
            const SizedBox(height: 20),
            const Text(
              "🎉 BOOM!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "You won $reward coins!",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white.withOpacity(0.95),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
