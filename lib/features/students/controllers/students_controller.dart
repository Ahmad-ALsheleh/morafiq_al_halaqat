import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant.dart';
import '../models/students_model.dart';
import '../repositories/student_repository.dart';

class StudentsController extends GetxController {
  final StudentsRepository _repository = StudentsRepository();

  var students = <Student>[].obs;
  var isAdding = false.obs;
  var isDeleting = false.obs;

  @override
  void onInit() {
    super.onInit();
    _repository.getStudents().listen((data) {
      students.value = data;
    });
  }

  Future<void> addStudent(String name) async {
    if (name.isEmpty) {
      Get.snackbar("خطأ", "الاسم لا يمكن أن يكون فارغًا",
          snackPosition: SnackPosition.TOP,
          backgroundColor: praimaryColor,
          icon: const Icon(Icons.error, size: 28));
      return;
    }

    if (isAdding.value) return;
    isAdding.value = true;

    try {
      await _repository.addStudent(name);

      Get.back();
      Get.snackbar("نجاح", "تم إضافة الطالب بنجاح",
          snackPosition: SnackPosition.TOP,
          backgroundColor: praimaryColor,
          duration: Duration(seconds: 1),

          icon: const Icon(Icons.done, size: 28));
    } catch (e) {
      Get.snackbar("خطأ", "فشل إضافة الطالب",
          snackPosition: SnackPosition.TOP,
          backgroundColor: praimaryColor,
          duration: Duration(seconds: 1),
          icon: const Icon(Icons.error, size: 28));
    } finally {
      isAdding.value = false;
    }
  }

  Future<void> removeStudent(String studentId) async {
    if (isDeleting.value) return;
    isDeleting.value = true;

    try {
      await _repository.removeStudent(studentId);

      Get.back();
      Get.snackbar("نجاح", "تم حذف الطالب بنجاح",
          snackPosition: SnackPosition.TOP,
          backgroundColor: praimaryColor,
          duration: Duration(seconds: 1),
          icon: const Icon(Icons.done, size: 28));
    } catch (e) {
      Get.snackbar("خطأ", "فشل حذف الطالب",
          snackPosition: SnackPosition.TOP,
          backgroundColor: praimaryColor,
          duration: Duration(seconds: 1),
          icon: const Icon(Icons.error, size: 28));
    } finally {
      isDeleting.value = false;
    }
  }
}