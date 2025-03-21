import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';
import '../controllers/StatisticsController.dart';

class HalaqahStatisticsView extends StatelessWidget {
  final StatisticsController controller = Get.put(StatisticsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'إحصائيات الحلقة',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Obx(() => _buildStatCard(
              title: "عدد الطلاب",
              value: controller.studentsCount.value.toString(),
              icon: Icons.groups,
            )),

            SizedBox(height: 15),

            Obx(() => _buildStatCard(
              title: "عدد الدروس",
              value: controller.lessonsCount.value.toString(),
              icon: Icons.menu_book,
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({required String title, required String value, required IconData icon}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: praimaryColor.withOpacity(0.1),
              radius: 30,
              child: Icon(icon, color: praimaryColor, size: 35),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: praimaryColor),
                ),
                SizedBox(height: 5),
                Text(
                  value,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: black87Color),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
