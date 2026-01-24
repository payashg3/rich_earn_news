import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_screen.dart';
import 'article_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List newsList = [];
  bool loading = true;

  List dummyNews = [
    {
      "title": "भारत में AI से बदलेगा पढ़ाई का तरीका",
      "description":
          "सरकार नए AI आधारित शिक्षा प्लेटफॉर्म लॉन्च करने जा रही है जिससे छात्रों को पर्सनलाइज्ड लर्निंग मिलेगी।",
      "image": "https://images.unsplash.com/photo-1522202176988-66273c2fd55f",
      "url": "https://example.com/news1",
    },
    {
      "title": "शेयर बाजार में जबरदस्त उछाल",
      "description":
          "आज सेंसेक्स 500 अंक ऊपर बंद हुआ, निवेशकों में भारी उत्साह देखने को मिला।",
      "image": "https://images.unsplash.com/photo-1507679799987-c73779587ccf",
      "url": "https://example.com/news2",
    },
    {
      "title": "नई फिल्म ने तोड़े सारे रिकॉर्ड",
      "description": "बॉलीवुड की नई फिल्म ने पहले दिन 100 करोड़ की कमाई कर ली।",
      "image": "https://images.unsplash.com/photo-1497032628192-86f99bcd76bc",
      "url": "https://example.com/news3",
    },
    {
      "title": "भारत में 5G नेटवर्क का विस्तार",
      "description": "देश के 200 नए शहरों में 5G सेवाएं शुरू होने जा रही हैं।",
      "image": "https://images.unsplash.com/photo-1518770660439-4636190af475",
      "url": "https://example.com/news4",
    },
  ];

  int coins = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      newsList = dummyNews;
      loading = false;
    });
    fetchCoins();
  }

  // FETCH COINS
  Future<void> fetchCoins() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get();

    if (doc.exists) {
      setState(() {
        coins = doc["coins"] ?? 0;
      });
    }
  }

  // ADD COINS
  Future<void> addCoins() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      "coins": FieldValue.increment(5),
    });

    fetchCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RichEarn News"),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                "$coins 🪙",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  newsList = dummyNews;
                });
              },
              child: ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final item = newsList[index];

                  return Card(
                    margin: EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (item["image"] != null)
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              item["image"],
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
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
                              Text(
                                item["description"] ?? "",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "+5 Coins 🪙",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await addCoins();
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
            ),
    );
  }
}
