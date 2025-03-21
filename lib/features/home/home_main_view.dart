import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant.dart';
import '../lessons/controllers/lesson_controller.dart';

class HomeMainView extends StatelessWidget {
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
              child: Obx(
                    () => ListView.builder(
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
                          lesson['title']!,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(lesson['description']!),
                        trailing: IconButton(
                          icon: Icon(Icons.edit, color: goldenColor),
                          onPressed: () => controller.showEditLessonDialog(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: praimaryColor,
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 45, color: whiteColor),
        onPressed: controller.showAddLessonDialog,
      ),
    );
  }
}
