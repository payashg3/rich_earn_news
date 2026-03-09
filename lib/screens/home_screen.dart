import 'package:flutter/material.dart';
import 'news_screen.dart';
import 'games_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/streak_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List screens = [const GamesScreen(), const NewsScreen()];

  BannerAd? _bannerAd;
  bool _isBannerLoaded = false;

  // 🔥 Daily Streak Check
  void checkStreak() async {
    int streak = await StreakManager.checkDailyLogin();

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("🔥 Daily Login Bonus"),
        content: Text("Day $streak streak reward collected!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Nice"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // 🔥 Check daily streak when app opens
    checkStreak();

    _bannerAd = BannerAd(
      adUnitId: "ca-app-pub-9921766463937527/7965507816",
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isBannerLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: screens[selectedIndex]),

          if (_isBannerLoaded)
            SizedBox(
              height: _bannerAd!.size.height.toDouble(),
              width: _bannerAd!.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_esports),
            label: "Games",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "News"),
        ],
      ),
    );
  }
}
