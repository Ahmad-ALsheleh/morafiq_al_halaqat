import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant.dart';
import '../models/lesson_model.dart';
import '../repositories/lesson_repository.dart';

class LessonController extends GetxController {
  final LessonRepository _repository = LessonRepository();

  var lessons = <Lesson>[].obs;
  var isProcessing = false.obs;
  StreamSubscription? lessonsSubscription;

  @override
  void onInit() {
    super.onInit();
    listenToLessons();
  }

  @override
  void onClose() {
    lessonsSubscription?.cancel();
    super.onClose();
  }

  void showCustomSnackbar(String title, String message, IconData? icon) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: praimaryColor,
      duration: Duration(seconds: 1),
      icon: icon != null ? Icon(icon) : null,
    );
  }

  void listenToLessons() {
    lessonsSubscription = _repository.getLessons().listen(
          (data) {
        lessons.value = data;
      },
      onError: (_) {
        showCustomSnackbar("خطأ", "تعذر تحديث الدروس تلقائيًا", Icons.error);
      },
    );
  }

  Future<void> addLesson(String title, String description) async {
    if (isProcessing.value) return;
    isProcessing.value = true;

    if (title.isEmpty || description.isEmpty) {
      showCustomSnackbar("تنبيه", "يجب إدخال عنوان ووصف الدرس", Icons.warning);
      isProcessing.value = false;
      return;
    }

    try {
      Lesson newLesson = Lesson(id: "", title: title, description: description);
      await _repository.addLesson(newLesson);

      Get.back();
      showCustomSnackbar("نجاح", "تمت إضافة الدرس بنجاح", Icons.done);
    } catch (_) {
      showCustomSnackbar("خطأ", "فشل في إضافة الدرس", Icons.error);
    } finally {
      isProcessing.value = false;
    }
  }

  Future<void> updateLesson(String lessonId, String newTitle, String newDescription) async {
    if (newTitle.isEmpty || newDescription.isEmpty) {
      showCustomSnackbar("تنبيه", "يجب إدخال عنوان ووصف الدرس", Icons.warning);
      return;
    }

    try {
      Lesson updatedLesson = Lesson(id: lessonId, title: newTitle, description: newDescription);
      await _repository.updateLesson(lessonId, updatedLesson);

      Get.back();
      showCustomSnackbar("نجاح", "تم تعديل الدرس بنجاح", Icons.done);
    } catch (_) {
      showCustomSnackbar("خطأ", "فشل في تعديل الدرس", Icons.error);
    }
  }
}
