import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_screen.dart';
import 'article_screen.dart';
import '../utils/coin_manager.dart';
import 'wallet_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List newsList = [];
  bool loading = true;
  int coins = 0;

  late BannerAd _bannerAd;
  bool _isBannerLoaded = false;
  InterstitialAd? _interstitialAd;

  int readCount = 0;

  List dummyNews = [
    {
      "title": "भारत में AI से बदलेगा पढ़ाई का तरीका",
      "description": "सरकार नए AI प्लेटफॉर्म लॉन्च करेगी।",
      "image": "https://images.unsplash.com/photo-1522202176988-66273c2fd55f",
      "url": "https://example.com/news1",
    },
    {
      "title": "शेयर बाजार में उछाल",
      "description": "आज सेंसेक्स 500 अंक ऊपर।",
      "image": "https://images.unsplash.com/photo-1507679799987-c73779587ccf",
      "url": "https://example.com/news2",
    },
  ];

  @override
  void initState() {
    super.initState();
    loadCoins();
    fetchNews();
    loadBanner();
    loadInterstitial();
    loadReadCount();
  }

  void loadCoins() async {
    final c = await CoinManager.getCoins();
    if (!mounted) return;
    setState(() => coins = c);
  }

  Future<void> addCoins() async {
    await CoinManager.addCoins(5);
    loadCoins();
  }

  Future<void> loadReadCount() async {
    final prefs = await SharedPreferences.getInstance();
    readCount = prefs.getInt("readCount") ?? 0;
  }

  Future<void> saveReadCount() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("readCount", readCount);
  }

  void loadBanner() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-9921766463937527/1539700265',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) return;
          setState(() => _isBannerLoaded = true);
        },
        onAdFailedToLoad: (ad, error) => ad.dispose(),
      ),
    )..load();
  }

  void loadInterstitial() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-9921766463937527/2727485396',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (error) => _interstitialAd = null,
      ),
    );
  }

  void showInterstitialIfNeeded() {
    if (readCount % 5 == 0 && _interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null;
      loadInterstitial();
    }
  }

  void openWallet() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const WalletScreen()),
    );
  }

  Future<void> fetchNews() async {
    setState(() => loading = true);

    final api1 = await fetchFromApi1();
    if (api1.isNotEmpty) {
      setState(() {
        newsList = api1;
        loading = false;
      });
      return;
    }

    final api2 = await fetchFromApi2();
    if (api2.isNotEmpty) {
      setState(() {
        newsList = api2;
        loading = false;
      });
      return;
    }

    setState(() {
      newsList = dummyNews;
      loading = false;
    });
  }

  Future<List> fetchFromApi1() async {
    try {
      final res = await http.get(
        Uri.parse(
          "https://gnews.io/api/v4/top-headlines?country=in&lang=hi&token=e1b7a7b8c62d9309f1a5aed5be03e266",
        ),
      );
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        return data["articles"].map((e) {
          return {
            "title": e["title"],
            "description": e["description"],
            "image": e["urlToImage"],
            "url": e["url"],
          };
        }).toList();
      }
    } catch (_) {}
    return [];
  }

  Future<List> fetchFromApi2() async {
    try {
      final res = await http.get(
        Uri.parse(
          "https://api.currentsapi.services/v1/latest-news?apiKey=YOUR_KEY",
        ),
      );
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        return data["news"].map((e) {
          return {
            "title": e["title"],
            "description": e["description"],
            "image": e["image"],
            "url": e["url"],
          };
        }).toList();
      }
    } catch (_) {}
    return [];
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _interstitialAd?.dispose();
    super.dispose();
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
          child: loading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.amber),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "RichEarn News",
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
                                    "$coins 🪙",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LoginScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: RefreshIndicator(
                        color: Colors.amber,
                        onRefresh: fetchNews,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: newsList.length,
                          itemBuilder: (context, index) {
                            final item = newsList[index];

                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListTile(
                                title: Text(
                                  item["title"] ?? "",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  item["description"] ?? "",
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                trailing: ElevatedButton(
                                  onPressed: () async {
                                    await addCoins();
                                    readCount++;
                                    await saveReadCount();
                                    showInterstitialIfNeeded();

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            ArticleScreen(url: item["url"]),
                                      ),
                                    );
                                  },
                                  child: const Text("Read"),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    if (_isBannerLoaded)
                      SizedBox(
                        height: _bannerAd.size.height.toDouble(),
                        width: _bannerAd.size.width.toDouble(),
                        child: AdWidget(ad: _bannerAd),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
