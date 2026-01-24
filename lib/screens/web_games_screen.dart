import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../utils/coin_manager.dart';

class WebGamesScreen extends StatefulWidget {
  const WebGamesScreen({super.key});

  @override
  State<WebGamesScreen> createState() => _WebGamesScreenState();
}

class _WebGamesScreenState extends State<WebGamesScreen> {
  late WebViewController controller;
  bool rewarded = false;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.gamezop.com"));
  }

  Future<void> reward() async {
    if (rewarded) return;
    rewarded = true;

    if (await CoinManager.canAdd(10)) {
      await CoinManager.add(10);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("+10 Coins for playing 🪙")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Daily limit reached")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await reward(); // reward on exit
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Online Games")),
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
