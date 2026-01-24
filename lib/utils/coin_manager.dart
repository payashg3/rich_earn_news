import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CoinManager {
  static final _db = FirebaseFirestore.instance;
  static final _uid = FirebaseAuth.instance.currentUser!.uid;

  static Future<bool> canAdd(int amount) async {
    final doc = await _db.collection("users").doc(_uid).get();

    if (!doc.exists) return true;

    if (!doc.data()!.containsKey("lastSpin")) return true;

    Timestamp ts = doc["lastSpin"];
    DateTime last = ts.toDate();
    final now = DateTime.now();

    return now.difference(last).inHours >= 24;
  }

  static Future<void> add(int amount) async {
    await _db.collection("users").doc(_uid).set({
      "coins": FieldValue.increment(amount),
      "lastSpin": FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
