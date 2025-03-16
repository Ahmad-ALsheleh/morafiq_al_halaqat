import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('البروفايل', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: greyColor,
                    child: Icon(Icons.person, color: praimaryColor, size: 60),
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.camera_alt, color: Colors.black, size: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Obx(() => Text(
              controller.userName.value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Obx(() => Text(controller.email.value, style: TextStyle(color: Colors.grey))),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controller.updateProfile('اسم جديد', 'رقم جديد', 'إيميل جديد');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('تعديل', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('معلومات الحساب'),
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
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: Icon(Icons.logout, color: Colors.white),
              label: Text('تسجيل خروج', style: TextStyle(color: Colors.white)),
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
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: value.isNotEmpty ? Text(value, style: TextStyle(color: Colors.grey)) : null,
      trailing: Icon(Icons.edit, color: Colors.black54),
    );
  }
}
