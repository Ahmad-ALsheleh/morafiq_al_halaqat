import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant.dart';

class MyHalaqahController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var students =
      <Map<String, dynamic>>[].obs; //  تغيير القائمة إلى Maps
  var isAdding = false.obs;
  var isDeleting = false.obs;

  @override
  void onInit() {
    super.onInit();
    getStudents();
  }

  void getStudents() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('students')
            .snapshots()
            .listen((studentsSnapshot) {
          if (studentsSnapshot.docs.isNotEmpty) {
            for (var doc in studentsSnapshot.docs) {
            }
          }

          students.value = studentsSnapshot.docs
              .map((doc) =>
                  {'id': doc.id, ...doc.data() as Map<String, dynamic>})
              .toList();
        }, onError: (e) {
          Get.snackbar("خطأ", "حدث خطأ في جلب الطلاب",
              snackPosition: SnackPosition.TOP, backgroundColor: praimaryColor,
            icon: Icon(Icons.error, size: 28),
          );
        });
      } catch (e) {
      }
    } else {
      Get.snackbar("تنبيه", "يجب تسجيل الدخول أولاً",
          snackPosition: SnackPosition.TOP, backgroundColor: praimaryColor,
          icon: Icon(Icons.warning, size: 28),
    );
    }
  }


  Future<void> addStudent(String name) async {
    if (name.isEmpty) {
      Get.snackbar("خطأ", "الاسم لا يمكن أن يكون فارغًا",
          snackPosition: SnackPosition.TOP, backgroundColor: praimaryColor,
        icon: Icon(Icons.error, size: 28),
      );
      return;
    }

    if (isAdding.value) return;
    isAdding.value = true;

    try {
      String uid = _auth.currentUser?.uid ?? "";
      if (uid.isEmpty) {
        Get.snackbar("تنبيه", "لم يتم العثور على المستخدم الحالي",
            snackPosition: SnackPosition.TOP, backgroundColor: praimaryColor,
          icon: Icon(Icons.warning, size: 28),
        );
        return;
      }

      var docRef = await _firestore
          .collection("users")
          .doc(uid)
          .collection("students")
          .add({
        'name': name,
      });


      Get.back();

      Get.snackbar("نجاح", "تم إضافة الطالب بنجاح",
          snackPosition: SnackPosition.TOP, backgroundColor: praimaryColor,
        icon: Icon(Icons.done, size: 28),
      );
    } catch (e) {
      Get.snackbar("خطأ", "فشل إضافة الطالب",
          snackPosition: SnackPosition.TOP, backgroundColor: praimaryColor,
        icon: Icon(Icons.error, size: 28),
      );
    } finally {
      isAdding.value = false; // إعادة تعيين الحالة للسماح بمحاولة جديدة
    }
  }

  Future<void> removeStudent(String studentId) async {
    if (isDeleting.value) return;
    isDeleting.value = true;

    try {
      String uid = _auth.currentUser?.uid ?? "";
      if (uid.isEmpty) {
        Get.snackbar("تنبيه", "لم يتم العثور على المستخدم الحالي",
            snackPosition: SnackPosition.TOP, backgroundColor: praimaryColor,
          icon: Icon(Icons.warning, size: 28),
        );
        isDeleting.value = false;
        return;
      }

      await _firestore
          .collection("users")
          .doc(uid)
          .collection("students")
          .doc(studentId)
          .delete();

      Get.back();
      Get.snackbar("نجاح", "تم حذف الطالب بنجاح",
          snackPosition: SnackPosition.TOP, backgroundColor: praimaryColor,
        icon: Icon(Icons.done, size: 28),
      );
    } catch (e) {
      Get.snackbar("خطأ", "فشل حذف الطالب",
          snackPosition: SnackPosition.TOP, backgroundColor: praimaryColor,
        icon: Icon(Icons.error, size: 28),
      );
    } finally {
      isDeleting.value = false;
    }
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
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: blackColor),
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: TextField(
            controller: nameController,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: "أدخل اسم الطالب",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            ),
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "إلغاء",
              style: TextStyle(
                  fontSize: 23, color: redColor, fontWeight: FontWeight.w400),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (!isAdding.value) {
                addStudent(
                    nameController.text);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: praimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Obx(() => Text(
                  isAdding.value ? "جارٍ الإضافة..." : "إضافة",
                  style: TextStyle(
                      fontSize: 23,
                      color: whiteColor,
                      fontWeight: FontWeight.w500),
                )),
          )
        ],
      ),
      barrierDismissible: false,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }


  void showDeleteConfirmationDialog(String studentId, String studentName, Function onConfirmDelete) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Center(
          child: Text(
            "تأكيد الحذف",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: blackColor),
          ),
        ),
        content: Text(
          "هل أنت متأكد أنك تريد حذف الطالب $studentName؟",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("إلغاء", style: TextStyle(fontSize: 23, color: redColor, fontWeight: FontWeight.w400)),
          ),
          ElevatedButton(
            onPressed: () {
              onConfirmDelete();
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: praimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text("حذف", style: TextStyle(fontSize: 23, color: whiteColor, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

}

