import 'package:get/get.dart';
import 'package:myapp/views/login_page.dart';
import '../views/home_page.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  var fakeOtp = "".obs;

  void sendOtp(String phone) {
    // generate a fake OTP and store it
    fakeOtp.value = "123456";
    Get.snackbar("OTP Sent", "Check your phone for OTP",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.shade100);
  }

  void verifyOtp(String otp) {
    if (otp == fakeOtp.value) {
      Get.offAll(() => const HomePage(title: '',));
    } else {
      Get.snackbar("Error", "Invalid OTP",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red.shade100);
    }
  }

  void logout() {
    Get.offAll(() => LoginPage());
  }
}
