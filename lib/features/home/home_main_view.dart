import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(lesson['description']!),
                        trailing: IconButton(
                          icon: SvgPicture.asset('assets/icons/edit.svg',
                              width: 16,
                              height: 18,
                              colorFilter: ColorFilter.mode(
                                  goldenColor, BlendMode.srcIn)),
                          onPressed: () =>
                              controller.showEditLessonDialog(
                                lesson['id'], // معرف الدرس في Firestore
                                lesson['title'],
                                lesson['description'],),
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
      floatingActionButton: FloatingActionButton (
        onPressed: () { controller.showAddLessonDialog(); },
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: SvgPicture.asset('assets/icons/add.svg',
            colorFilter: ColorFilter.mode(praimaryColor, BlendMode.srcIn)
        ),
      ),
    );
  }
}
