import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/coin_manager.dart';

class ArticleScreen extends StatefulWidget {
  final String url;
  const ArticleScreen({super.key, required this.url});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen>
    with WidgetsBindingObserver {
  WebViewController? _controller;

  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  double progress = 0.0;
  Timer? _timer;
  bool timerStarted = false;

  bool pageLoaded = false;
  bool appInForeground = true;

  bool claimEnabled = false;
  bool alreadyClaimed = false;

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  late String articleHash;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    articleHash = sha1.convert(utf8.encode(widget.url)).toString();
    checkAlreadyClaimed();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            pageLoaded = true;
            startTimer();
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-9921766463937527/5586756481',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isAdLoaded = true),
        onAdFailedToLoad: (ad, error) => ad.dispose(),
      ),
    )..load();
  }

  Future<void> checkAlreadyClaimed() async {
    final uid = _auth.currentUser!.uid;
    final doc = await _firestore
        .collection("users")
        .doc(uid)
        .collection("claimedArticles")
        .doc(articleHash)
        .get();

    if (doc.exists) {
      setState(() => alreadyClaimed = true);
    }
  }

  void startTimer() {
    if (timerStarted || alreadyClaimed) return;
    timerStarted = true;

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!pageLoaded || !appInForeground) return;

      setState(() {
        progress += 0.01;
      });

      if (progress >= 1) {
        claimEnabled = true;
        timer.cancel();
      }
    });
  }

  Future<void> claimCoins() async {
    final uid = _auth.currentUser!.uid;

    await CoinManager.addCoins(10);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("🎉 10 Coins Added"),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
      ),
    );

    await _firestore
        .collection("users")
        .doc(uid)
        .collection("claimedArticles")
        .doc(articleHash)
        .set({"url": widget.url, "time": DateTime.now().toIso8601String()});

    setState(() {
      alreadyClaimed = true;
      claimEnabled = false;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    appInForeground = (state == AppLifecycleState.resumed);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Article")),
      body: Column(
        children: [
          if (!alreadyClaimed)
            LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation(Colors.green),
            ),

          Expanded(
            child: _controller == null
                ? const Center(child: CircularProgressIndicator())
                : WebViewWidget(controller: _controller!),
          ),

          if (!alreadyClaimed)
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: claimEnabled ? claimCoins : null,
                child: const Text("CLAIM 10 COINS"),
              ),
            ),

          if (_isAdLoaded)
            SizedBox(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
        ],
      ),
    );
  }
}
