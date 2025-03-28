import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morafiq_al_halaqat/core/constant.dart';

class CreateAccountController extends GetxController {
  var isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createAccount(String email, String password) async {
    try {
      isLoading.value = true;

      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      Get.snackbar(
        "نجاح",
        "تم إنشاء الحساب بنجاح! يمكنك تسجيل الدخول الآن.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: praimaryColor,
        icon: Icon(Icons.done, size: 28),

      );

      Get.offAllNamed('/login');

    } on FirebaseAuthException catch (e) {
      String errorMessage = "حدث خطأ أثناء التسجيل";

      if (e.code == 'email-already-in-use') {
        errorMessage = "هذا البريد مسجل مسبقًا";
      } else if (e.code == 'weak-password') {
        errorMessage = "كلمة المرور ضعيفة جدًا. يرجى استخدام كلمة أقوى.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "يرجى إدخال بريد إلكتروني صالح.";
      }

      Get.snackbar(
        "خطأ",
        errorMessage,
        snackPosition: SnackPosition.TOP,
        backgroundColor: praimaryColor,
        icon: Icon(Icons.error, size: 28),
      );

    } catch (e) {
      Get.snackbar(
        "خطأ غير متوقع",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: praimaryColor,
        icon: Icon(Icons.error, size: 28),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
