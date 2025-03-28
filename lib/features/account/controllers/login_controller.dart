import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';
import '../../../core/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../repositorys/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository _repository = LoginRepository();
  var isLoading = false.obs;

  void showCustomSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: praimaryColor,
      icon: const Icon(Icons.error, size: 28),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }

  Future<void> login(String email, String password) async {
    email = email.trim();
    password = password.trim();

    if (email.isEmpty || password.isEmpty) {
      showCustomSnackbar("خطأ", "يرجى إدخال البريد الإلكتروني وكلمة المرور");
      return;
    }

    if (!isValidEmail(email)) {
      showCustomSnackbar("خطأ", "يرجى إدخال بريد إلكتروني صحيح");
      return;
    }

    try {
      isLoading.value = true;
      UserCredential? userCredential = await _repository.login(email, password);

      if (userCredential?.user == null) {
        showCustomSnackbar("خطأ", "فشل تسجيل الدخول، المستخدم غير معروف");
        return;
      }

      Get.offAllNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e);
    } catch (e) {
      showCustomSnackbar("خطأ غير متوقع", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void handleFirebaseAuthException(FirebaseAuthException e) {
    String errorMessage = "حدث خطأ أثناء تسجيل الدخول";

    if (e.code == 'user-not-found' || e.code == 'INVALID_LOGIN_CREDENTIALS') {
      errorMessage = "البريد الإلكتروني غير مسجل";
    } else if (e.code == 'wrong-password' || e.code == 'INVALID_LOGIN_CREDENTIALS') {
      errorMessage = "كلمة المرور غير صحيحة";
    } else if (e.code == 'invalid-email') {
      errorMessage = "يرجى إدخال بريد إلكتروني صحيح";
    } else if (e.code == 'invalid-credential') {
      errorMessage = "بيانات تسجيل الدخول غير صحيحة، يرجى التحقق من البريد وكلمة المرور";
    } else if (e.code == 'too-many-requests') {
      errorMessage = "تم حظر الحساب مؤقتًا بسبب محاولات تسجيل دخول متكررة. يرجى المحاولة لاحقًا.";
    }

    showCustomSnackbar("خطأ", errorMessage);
  }
}

