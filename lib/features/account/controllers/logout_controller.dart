import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repositorys/logout_repository.dart';

class LogOutController extends GetxController {
  final LogOutRepository _repository = LogOutRepository();

  Future<void> logout() async {
    try {
      await _repository.logOut();
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar(
        "خطأ",
        "حدث خطأ أثناء تسجيل الخروج",
        icon: const Icon(Icons.error, size: 28),
      );
    }
  }
}
