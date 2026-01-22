import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'article_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List newsList = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final res = await http.get(
      Uri.parse(
        "http://api.mediastack.com/v1/news?access_key=6aead1479889f6a84ad54403f3b835af&countries=in",
      ),
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);

      setState(() {
        newsList = data["data"] ?? [];
      });
    } else {
      print("News API Error: ${res.statusCode}");
      print(res.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RichEarn News")),
      body: newsList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final item = newsList[index];

                return Card(
                  margin: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ✅ MEDIATASTACK IMAGE
                      if (item["image"] != null) Image.network(item["image"]),

                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["title"] ?? "",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(item["description"] ?? ""),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "+5 Coins 🪙",
                                  style: TextStyle(color: Colors.green),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            ArticleScreen(url: item["url"]),
                                      ),
                                    );
                                  },

                                  child: Text("Read"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
