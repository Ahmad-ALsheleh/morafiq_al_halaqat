import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';

class LessonController extends GetxController {
  var lessons = <Map<String, String>>[].obs;

  void addLesson(String title, String description) {
    if (title.isNotEmpty && description.isNotEmpty) {
      lessons.insert(0, {'title': title, 'description': description});
      Get.back();
    }
  }

  void updateLesson(int index, String newTitle, String newDescription) {
    if (newTitle.isNotEmpty && newDescription.isNotEmpty) {
      lessons[index] = {'title': newTitle, 'description': newDescription};
      Get.back();
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
            onPressed: () => addLesson(titleController.text, descriptionController.text),
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

  void showEditLessonDialog(int index) {
    TextEditingController titleController = TextEditingController(text: lessons[index]['title']);
    TextEditingController descriptionController = TextEditingController(text: lessons[index]['description']);
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
            onPressed: () => updateLesson(index, titleController.text, descriptionController.text),
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      titleFocus.requestFocus();
    });
  }
}
