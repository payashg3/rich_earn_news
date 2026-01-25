import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CoinManager {
  static final _firestore = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;

  static Future<int> getCoins() async {
    final uid = _auth.currentUser!.uid;
    final doc = await _firestore.collection("users").doc(uid).get();

    if (!doc.exists) {
      // first time user
      await _firestore.collection("users").doc(uid).set({
        "coins": 0,
        "lastSpin": DateTime.now().toIso8601String(),
      });
      return 0;
    }

    final data = doc.data();
    return (data?["coins"] ?? 0) as int;
  }

  static Future<void> addCoins(int value) async {
    final uid = _auth.currentUser!.uid;

    await _firestore.collection("users").doc(uid).update({
      "coins": FieldValue.increment(value),
      "lastSpin": DateTime.now().toIso8601String(),
    });
  }
}
