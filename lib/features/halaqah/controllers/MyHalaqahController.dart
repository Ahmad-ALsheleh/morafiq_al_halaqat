import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:morafiq_al_halaqat/core/constant.dart';

class MyHalaqahController extends GetxController {
  var students = <String>[].obs;

  void addStudent(String name) {
    if (name.isNotEmpty) {
      students.add(name);
      Get.back();
    }
  }

  void removeStudent(int index) {
    students.removeAt(index);
  }

  void addStudentDialog() {
    TextEditingController nameController = TextEditingController();
    FocusNode focusNode = FocusNode();

    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Center(
          child: Text(
            "إضافة طالب جديد",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: blackColor),
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: TextField(
            controller: nameController,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: "أدخل اسم الطالب",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            ),
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("إلغاء", style: TextStyle(fontSize: 23, color: redColor, fontWeight: FontWeight.w400)),
          ),
          ElevatedButton(
            onPressed: () => addStudent(nameController.text),
            style: ElevatedButton.styleFrom(
              backgroundColor: praimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text("إضافة", style: TextStyle(fontSize: 23, color: whiteColor,fontWeight: FontWeight.w500)),
          ),
        ],
      ),
      barrierDismissible: false,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }
}
