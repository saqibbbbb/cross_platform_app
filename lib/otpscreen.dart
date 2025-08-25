
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/views/home_page.dart';
import 'dart:developer';

class OTPScreen extends StatefulWidget {
  String verificationid;
  OTPScreen({super.key, required this.verificationid});
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP Screen "), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter the OTP",
                icon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          SizedBox(height: 38),
          ElevatedButton(
            onPressed: () async {
              try {
                PhoneAuthCredential credential =
                    await PhoneAuthProvider.credential(
                      verificationId: widget.verificationid,
                      smsCode: otpController.text.toString());
                    FirebaseAuth.instance.signInWithCredential(credential).then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: "HomePage")));
                    });
              } catch (ex) {
                log(ex.toString());
              }
            },
            child: Text("OTP"),
          ),
        ],
      ),
    );
  }
}
