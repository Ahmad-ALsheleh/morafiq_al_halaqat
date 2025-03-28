import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';
import '../controllers/my_halaqah_controller.dart';

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
                                  student['name'].toString().isNotEmpty
                                      ? student['name'][0]
                                      : "?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: praimaryColor),
                                ),
                              ),
                              title: Text(
                                student['name'] ?? "اسم غير معروف",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              trailing: IconButton(
                                icon:
                              SvgPicture.asset('assets/icons/delete.svg',
                            colorFilter: ColorFilter.mode(red7Color, BlendMode.srcIn),
                            ),
                                  onPressed: () => controller.showDeleteConfirmationDialog(
                                    student['id'],
                                    student['name'],
                                        () => controller.removeStudent(student['id']),
                                  ), // ✅ إصلاح المشكلة

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
          controller.addStudentDialog();
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
}
