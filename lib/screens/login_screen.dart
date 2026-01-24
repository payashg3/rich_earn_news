import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPhoneLogin = true;
  bool otpSent = false;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  // SEND OTP
  Future<void> sendOTP() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        successLogin();
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.message ?? "OTP Failed")));
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
          otpSent = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  // VERIFY OTP
  Future<void> verifyOTP() async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otpController.text,
      );
      await _auth.signInWithCredential(credential);
      successLogin();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid OTP ❌")));
    }
  }

  Future<void> emailLogin() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      successLogin();
    } on FirebaseAuthException catch (e) {
      String msg = "Login failed";

      if (e.code == 'user-not-found') {
        msg = "No account found with this email";
      } else if (e.code == 'wrong-password') {
        msg = "Wrong password";
      } else if (e.code == 'invalid-email') {
        msg = "Invalid email format";
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    }
  }

  void successLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
    // yahan baad me HomeScreen daal denge
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "RichEarn Login",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegisterScreen()),
                );
              },
              child: Text("Don't have an account? Register"),
            ),

            // Toggle
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPhoneLogin = true;
                        otpSent = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPhoneLogin ? Colors.blue : Colors.grey,
                    ),
                    child: Text("Login by Phone"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPhoneLogin = false;
                        otpSent = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !isPhoneLogin
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    child: Text("Login by Email"),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            // PHONE FLOW
            if (isPhoneLogin) ...[
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  prefixText: "+91 ",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),

              if (otpSent)
                TextField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter OTP",
                    border: OutlineInputBorder(),
                  ),
                ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: otpSent ? verifyOTP : sendOTP,
                child: Text(otpSent ? "Verify OTP" : "Send OTP"),
              ),
            ]
            // EMAIL FLOW
            else ...[
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: emailLogin, child: Text("Login")),
            ],
          ],
        ),
      ),
    );
  }
}
