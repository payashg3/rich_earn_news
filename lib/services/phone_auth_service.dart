import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthService {
  final _auth = FirebaseAuth.instance;

  String? _verificationId;

  // Send OTP
  Future<void> sendOTP(String phone) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (cred) async {
        await _auth.signInWithCredential(cred);
      },
      verificationFailed: (e) {
        throw e;
      },
      codeSent: (verificationId, _) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (id) {
        _verificationId = id;
      },
    );
  }

  // Verify OTP
  Future<void> verifyOTP(String otp) async {
    final cred = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: otp,
    );
    await _auth.signInWithCredential(cred);
  }
}
