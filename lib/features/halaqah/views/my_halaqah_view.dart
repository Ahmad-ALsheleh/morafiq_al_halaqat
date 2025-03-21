import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';
import '../controllers/MyHalaqahController.dart';

class MyHalaqahView extends StatelessWidget {
  final MyHalaqahController controller = Get.put(MyHalaqahController());

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
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: blackColor),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.students.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: praimaryColor.withOpacity(0.2),
                          child: Text(
                            controller.students[index][0],
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: praimaryColor),
                          ),
                        ),
                        title: Text(
                          controller.students[index],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: redColor, size: 23),
                          onPressed: () => controller.removeStudent(index),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: praimaryColor,
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 40, color: whiteColor),
        onPressed: () => controller.addStudentDialog(),
      ),
    );
  }
}
