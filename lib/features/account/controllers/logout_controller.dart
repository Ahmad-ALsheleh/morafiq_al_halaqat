import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> logout_controller() async {
  try {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login');
  } catch (e) {
    Get.snackbar("خطأ", "حدث خطأ أثناء تسجيل الخروج",icon: Icon(Icons.error, size: 28),
    );
  }
}