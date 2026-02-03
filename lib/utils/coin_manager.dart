import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class CoinManager {
  static final _firestore = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;

  static ValueNotifier<int> coinNotifier = ValueNotifier(0);

  // Call this once when app starts
  static Future<void> loadCoins() async {
    final coins = await getCoins();
    coinNotifier.value = coins;
  }

  static Future<int> getCoins() async {
    final uid = _auth.currentUser!.uid;
    final doc = await _firestore.collection("users").doc(uid).get();

    if (!doc.exists) {
      await _firestore.collection("users").doc(uid).set({
        "coins": 0,
        "lastSpin": DateTime.now().toIso8601String(),
      });
      return 0;
    }

    return (doc.data()?["coins"] ?? 0) as int;
  }

  static Future<void> addCoins(int value) async {
    final uid = _auth.currentUser!.uid;

    await _firestore.collection("users").doc(uid).update({
      "coins": FieldValue.increment(value),
      "lastSpin": DateTime.now().toIso8601String(),
    });

    // 🔥 locally bhi update
    coinNotifier.value = coinNotifier.value + value;
  }
}
