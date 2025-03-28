import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';

class LessonController extends GetxController {
  var lessons = <Map<String, dynamic>>[].obs;
  bool isProcessing = false;
  late StreamSubscription<QuerySnapshot>? lessonsSubscription;



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
      icon: icon != null ? Icon(icon,) : null,
    );
  }

  void listenToLessons() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    lessonsSubscription = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('lessons')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      lessons.value = snapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
    }, onError: (error) {
      showCustomSnackbar("خطأ", "تعذر تحديث الدروس تلقائيًا",
        Icons.error,
      );
    });
  }


  Future<void> addLesson(String title, String description) async {
    if (isProcessing) return;
    isProcessing = true;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      showCustomSnackbar("تنبيه", "يجب تسجيل الدخول أولًا",
        Icons.warning,
      );
      isProcessing = false;
      return;
    }

    if (title.isEmpty || description.isEmpty) {
      showCustomSnackbar("تنبيه", "يجب إدخال عنوان ووصف الدرس",
        Icons.warning,

      );
      isProcessing = false;
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('lessons')
          .add({
        'title': title,
        'description': description,
        'timestamp': FieldValue.serverTimestamp(),
      });

      Get.back();
      showCustomSnackbar("نجاح", "تمت إضافة الدرس بنجاح",
          Icons.done,
    );
    } catch (e) {
      showCustomSnackbar("خطأ", "فشل في إضافة الدرس",
        Icons.error,
      );
    } finally {
      isProcessing = false;
    }
  }

  Future<void> updateLesson(String lessonId, String newTitle, String newDescription) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      showCustomSnackbar("تنبيه", "يجب تسجيل الدخول أولًا",
        Icons.warning,
      );
      return;
    }

    if (newTitle.isEmpty || newDescription.isEmpty) {
      showCustomSnackbar("تنبيه", "يجب إدخال عنوان ووصف الدرس",
        Icons.warning,
      );
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('lessons')
          .doc(lessonId)
          .update({'title': newTitle, 'description': newDescription});

      int index = lessons.indexWhere((lesson) => lesson['id'] == lessonId);
      if (index != -1) {
        lessons[index] = {'id': lessonId, 'title': newTitle, 'description': newDescription};
      }

      Get.back();
      showCustomSnackbar("نجاح", "تم تعديل الدرس بنجاح",
        Icons.done,
      );
    } catch (e) {
      showCustomSnackbar("خطأ", "فشل في تعديل الدرس",
        Icons.error,
      );
    }
  }

  void showAddLessonDialog() {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    FocusNode titleFocus = FocusNode();
    FocusNode descriptionFocus = FocusNode();

    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Center(
          child: Text(
            "إضافة درس جديد",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: blackColor),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              focusNode: titleFocus,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(Get.context!).requestFocus(descriptionFocus),
              decoration: InputDecoration(
                hintText: "عنوان الدرس",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              focusNode: descriptionFocus,
              decoration: InputDecoration(
                hintText: "وصف الدرس",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              ),
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("إلغاء", style: TextStyle(fontSize: 23, color: redColor, fontWeight: FontWeight.w400)),
          ),
          ElevatedButton(
            onPressed: () {
              addLesson(titleController.text, descriptionController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: praimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text("إضافة", style: TextStyle(fontSize: 23, color: whiteColor, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
      barrierDismissible: false,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      titleFocus.requestFocus();
    });
  }

  void showEditLessonDialog(String lessonId, String currentTitle, String currentDescription) {
    TextEditingController titleController = TextEditingController(text: currentTitle);
    TextEditingController descriptionController = TextEditingController(text: currentDescription);
    FocusNode titleFocus = FocusNode();
    FocusNode descriptionFocus = FocusNode();

    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Center(
          child: Text(
            "تعديل الدرس",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: blackColor),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              focusNode: titleFocus,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(Get.context!).requestFocus(descriptionFocus),
              decoration: InputDecoration(
                hintText: "عنوان الدرس",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              focusNode: descriptionFocus,
              decoration: InputDecoration(
                hintText: "وصف الدرس",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("إلغاء", style: TextStyle(fontSize: 23, color: redColor, fontWeight: FontWeight.w400)),
          ),
          ElevatedButton(
            onPressed: () {
              updateLesson(lessonId, titleController.text, descriptionController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: praimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text("حفظ", style: TextStyle(fontSize: 23, color: whiteColor, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

}
