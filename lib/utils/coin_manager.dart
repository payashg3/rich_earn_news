import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class CoinManager {
  static Future<bool> canAdd(int value) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final ref = FirebaseFirestore.instance.collection("users").doc(uid);
    final doc = await ref.get();

    final today = DateFormat("yyyy-MM-dd").format(DateTime.now());

    if (!doc.exists) {
      await ref.set({"coins": 0, "todayCoins": 0, "lastDate": today});
    }

    int todayCoins = doc["todayCoins"] ?? 0;
    String lastDate = doc["lastDate"] ?? today;

    if (lastDate != today) {
      await ref.update({"todayCoins": 0, "lastDate": today});
      todayCoins = 0;
    }

    return (todayCoins + value) <= 100; // daily cap
  }

  static Future<void> add(int value) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final ref = FirebaseFirestore.instance.collection("users").doc(uid);

    await ref.update({
      "coins": FieldValue.increment(value),
      "todayCoins": FieldValue.increment(value),
    });
  }
}
