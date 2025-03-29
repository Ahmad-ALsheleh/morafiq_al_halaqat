import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morafiq_al_halaqat/core/constant.dart';

import '../repositorys/create_account_repository.dart';

class CreateAccountController extends GetxController {
  var isLoading = false.obs;
  final CreateAccountRepository _repository = CreateAccountRepository();

  Future<void> createAccount(String email, String password) async {
    try {
      isLoading.value = true;

      await _repository.createAccount(email, password);

      Get.snackbar(
        "نجاح",
        "تم إنشاء الحساب بنجاح! يمكنك تسجيل الدخول الآن.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: praimaryColor,
        icon: Icon(Icons.done, size: 28),
      );

      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar(
        "خطأ",
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