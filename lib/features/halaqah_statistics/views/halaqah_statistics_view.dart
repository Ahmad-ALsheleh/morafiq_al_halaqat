import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';
import '../../home/nav_controller.dart';
import '../controllers/StatisticsController.dart';

class HalaqahStatisticsView extends StatelessWidget {
  final StatisticsController controller = Get.put(StatisticsController());
  final NavController navController = Get.find<NavController>(); // جلب الكنترولر المسؤول عن التنقل

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
              onTap: () => navController.selectedIndex(1),
            )),

            SizedBox(height: 15),

            Obx(() => _buildStatCard(
              title: "عدد الدروس",
              value: controller.lessonsCount.value.toString(),
              icon: Icons.menu_book,
              onTap: () => navController.selectedIndex(2),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Card(
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
      ),
    );
  }
}
