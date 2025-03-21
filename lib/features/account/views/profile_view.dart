import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: greyColor,
                    child: Icon(Icons.person, color: praimaryColor, size: 70),
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: whiteColor,
                    child: Icon(Icons.camera_alt, color:blackColor, size: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Obx(() => Text(
              controller.userName.value,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "ميزة قيد التطوير",
                  "هذه الميزة غير متاحة حالياً",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: praimaryColor,
                  colorText: whiteColor,
                  duration: Duration(seconds: 2),
                  borderRadius: 12,
                  margin: EdgeInsets.all(12),
                  icon: Icon(Icons.info, color: whiteColor, size: 28),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: praimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.5),
                ),
              ),
              child: Text('تعديل', style: TextStyle(fontSize: 25, color: whiteColor)),
            ),

            SizedBox(height: 20),
            _buildSectionTitle('معلومات الحساب',),
            Obx(() => _buildProfileItem(Icons.edit, 'الاسم والنسبة', controller.userName.value)),
            Obx(() => _buildProfileItem(Icons.phone, 'رقم الهاتف', controller.phoneNumber.value)),
            Obx(() => _buildProfileItem(Icons.email, 'البريد الإلكتروني', controller.email.value)),
            _buildProfileItem(Icons.lock, 'كلمة المرور', '********'),
            SizedBox(height: 20),
            _buildSectionTitle('معلومات أخرى'),
            _buildProfileItem(Icons.settings, 'الإعدادات', ''),
            _buildProfileItem(Icons.info, 'قيم التطبيق', ''),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: controller.logout,
              style: ElevatedButton.styleFrom(
                backgroundColor: praimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              icon: Icon(Icons.logout, color: whiteColor),
              label: Text('تسجيل خروج', style: TextStyle(fontSize:25,color: whiteColor)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: blackColor),
      title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: value.isNotEmpty ? Text(value, style: TextStyle(color:blackColor)) : null,
    );
  }
}
