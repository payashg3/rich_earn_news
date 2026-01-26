import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/coin_manager.dart';
import 'spin_game_screen.dart';
import 'tab_game_screen.dart';
import 'guess_number_screen.dart';
import 'scratch_and_win_game_screen.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  int coins = -1;

  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    loadCoins();

    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // TEST ID
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) return;
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
  }

  void loadCoins() async {
    final c = await CoinManager.getCoins();
    print("GAMES SCREEN COINS => $c");
    if (!mounted) return;
    setState(() {
      coins = c;
    });
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
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
                coins == -1 ? "Loading.." : "$coins 🪙",
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
        child: Column(
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
            gameCard(
              context,
              icon: Icons.card_giftcard,
              title: "Scratch & Win",
              subtitle: "Scratch the Card",
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ScratchGameScreen()),
                );
                loadCoins(); // BACK aate hi refresh
              },
            ),
            gameCard(
              context,
              icon: Icons.ondemand_video,
              title: "Watch Ad",
              subtitle: "Earn Rewards",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SpinGameScreen()),
                );
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
                  MaterialPageRoute(builder: (_) => const TapGameScreen()),
                );
                loadCoins(); // BACK aate hi refresh
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
                  MaterialPageRoute(builder: (_) => const GuessNumberScreen()),
                );
                loadCoins(); // BACK aate hi refresh
              },
            ),
            gameCard(
              context,
              icon: Icons.calculate,
              title: "Math Battle",
              subtitle: "Fast math questions",
              onTap: () {},
            ),
            gameCard(
              context,
              icon: Icons.visibility,
              title: "Reaction Game",
              subtitle: "Green aate hi tap karo",
              onTap: () {},
            Expanded(
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SpinGameScreen(),
                        ),
                      );
                    },
                  ),
                  gameCard(
                    context,
                    icon: Icons.ondemand_video,
                    title: "Watch Ad",
                    subtitle: "Earn Rewards",
                    onTap: () {
                      // yahan baad me rewarded ad lagaenge
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
                    icon: Icons.calculate,
                    title: "Math Battle",
                    subtitle: "Fast math questions",
                    onTap: () {},
                  ),
                  gameCard(
                    context,
                    icon: Icons.visibility,
                    title: "Reaction Game",
                    subtitle: "Green aate hi tap karo",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            if (_isAdLoaded)
              Container(
                height: _bannerAd.size.height.toDouble(),
                width: _bannerAd.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd),
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
