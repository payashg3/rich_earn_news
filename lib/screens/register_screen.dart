import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPhoneRegister = true;
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
        successRegister();
      },
      verificationFailed: (FirebaseAuthException e) {
        showError(e.message ?? "OTP Failed");
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
      successRegister();
    } catch (e) {
      showError("Invalid OTP");
    }
  }

  // EMAIL REGISTER
  Future<void> emailRegister() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      successRegister();
    } on FirebaseAuthException catch (e) {
      String msg = "Registration failed";

      if (e.code == 'email-already-in-use') {
        msg = "Account already exists";
      } else if (e.code == 'weak-password') {
        msg = "Password too weak";
      } else if (e.code == 'invalid-email') {
        msg = "Invalid email format";
      }

      showError(msg);
    }
  }

  void successRegister() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Registration Successful 🎉")));
    Navigator.pop(context); // back to login
  }

  void showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
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
              "Create Account",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // back to Login
              },
              child: Text("Already have an account? Login"),
            ),

            // Toggle
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPhoneRegister = true;
                        otpSent = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPhoneRegister
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    child: Text("By Phone"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPhoneRegister = false;
                        otpSent = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !isPhoneRegister
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    child: Text("By Email"),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            // PHONE REGISTER
            if (isPhoneRegister) ...[
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
                child: Text(otpSent ? "Verify & Register" : "Send OTP"),
              ),
            ]
            // EMAIL REGISTER
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
              ElevatedButton(
                onPressed: emailRegister,
                child: Text("Create Account"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
