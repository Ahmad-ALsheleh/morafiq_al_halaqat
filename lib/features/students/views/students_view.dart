import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';
import '../controllers/students_controller.dart';

class StudentsView extends StatelessWidget {
  final StudentsController controller = Get.put(StudentsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'قائمة الطلاب',
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: blackColor),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => controller.students.isEmpty
                    ? Center(
                    child: Text("لم تقم بإضافة طلاب بعد",style: TextStyle(fontSize: 25)))
                    : ListView.builder(
                        itemCount: controller.students.length,
                        itemBuilder: (context, index) {
                          final student = controller.students[index];

                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: praimaryColor.withOpacity(0.2),
                                child: Text(
                                  student.name.toString().isNotEmpty
                                      ? student.name[0]
                                      : "?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: praimaryColor),
                                ),
                              ),
                              title: Text(
                                student.name ?? "اسم غير معروف",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              trailing: IconButton(
                                icon:
                              SvgPicture.asset('assets/icons/delete.svg',
                            colorFilter: ColorFilter.mode(red7Color, BlendMode.srcIn),
                            ),
                                  onPressed: () => showDeleteConfirmationDialog(
                                    student.id,
                                    student.name,
                                        () => controller.removeStudent(student.id),
                                  ),

                            ),
                            )
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addStudentDialog();
        },
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: SvgPicture.asset('assets/icons/add.svg',
            colorFilter: ColorFilter.mode(praimaryColor, BlendMode.srcIn)),
      ),
    );
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
              if (!controller.isAdding.value) {
                controller.addStudent(
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
              controller.isAdding.value ? "جارٍ الإضافة..." : "إضافة",
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
