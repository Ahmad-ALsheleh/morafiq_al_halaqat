import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant.dart';
import '../controllers/lesson_controller.dart';

class LessonView extends StatelessWidget {
  final LessonController controller = Get.put(LessonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: greyColor,
              ),
              width: double.infinity,
              height: 160,
              child: Center(
                child: Text(
                  '\u202E﴿وَرَتِّلِ القُرآنَ تَرتيلًا﴾ِ',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'الدروس الأخيرة',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.lessons.isEmpty) {
                  return Center(
                    child: Text(
                      "لم تقم بإضافة دروس بعد",
                      style: TextStyle(fontSize: 25),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: controller.lessons.length,
                  itemBuilder: (context, index) {
                    var lesson = controller.lessons[index];
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          lesson.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(lesson.description),
                        trailing: IconButton(
                          icon: SvgPicture.asset(
                            'assets/icons/edit.svg',
                            width: 16,
                            height: 18,
                            colorFilter:
                                ColorFilter.mode(goldenColor, BlendMode.srcIn),
                          ),
                          onPressed: () => showEditLessonDialog(
                            lesson.id,
                            lesson.title,
                            lesson.description,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddLessonDialog();
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
              controller.addLesson(titleController.text, descriptionController.text);
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
              controller.updateLesson(lessonId, titleController.text, descriptionController.text);
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
