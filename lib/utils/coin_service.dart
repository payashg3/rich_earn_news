import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CoinService {
  static Future<int> getCoins() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get();

    return doc.data()?["coins"] ?? 0;
  }

  static Future<void> addCoins(int value) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      "coins": FieldValue.increment(value),
    });
  }
}
