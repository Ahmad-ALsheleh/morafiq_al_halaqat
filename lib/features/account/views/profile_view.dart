import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';
import '../controllers/logout_controller.dart';
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
                    backgroundColor: bgColor,
                    child: Image.asset(
                      'assets/images/Logo.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
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
                    child: CircleAvatar(

                      radius: 18,
                      backgroundColor: bkiconsColor,
                      child: SvgPicture.asset('assets/icons/camera.svg', width:29.17, height: 26.25,
                        colorFilter: ColorFilter.mode(blackColor, BlendMode.srcIn),),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Text( controller.email.value ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
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
              child: Text('تعديل', style: TextStyle(fontSize: 27, color: whiteColor)),
            ),

            SizedBox(height: 20),
            _buildSectionTitle('معلومات الحساب',),

            Obx(() => _buildProfileItem(SvgPicture.asset('assets/icons/email.svg', width: 26.17, height: 20.33,
              colorFilter: ColorFilter.mode(blackColor, BlendMode.srcIn),) , 'البريد الإلكتروني', controller.email.value)),
            _buildProfileItem(SvgPicture.asset('assets/icons/lock.svg', width:21.33, height: 28,
              colorFilter: ColorFilter.mode(blackColor, BlendMode.srcIn),), 'كلمة المرور', controller.password.value),
            SizedBox(height: 20),
            _buildSectionTitle('معلومات أخرى'),
            _buildProfileItem(SvgPicture.asset('assets/icons/settings.svg', width:24.56, height: 25,
              colorFilter: ColorFilter.mode(blackColor, BlendMode.srcIn),), 'الإعدادات', ''),
            _buildProfileItem(SvgPicture.asset('assets/icons/them.svg', width:23.75, height: 25,
              colorFilter: ColorFilter.mode(blackColor, BlendMode.srcIn),), 'ثيم التطبيق', ''),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: ()  {
                logout_controller();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: praimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('تسجيل خروج', style: TextStyle(fontSize: 27, color: whiteColor)),
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
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildProfileItem(Widget icon, String title, String value) {
    return ListTile(
      onTap: (){
        Get.snackbar( "ميزة قيد التطوير",
          "هذه الميزة غير متاحة حالياً",
          snackPosition: SnackPosition.TOP,
          backgroundColor: praimaryColor,
          colorText: whiteColor,
          duration: Duration(seconds: 2),
          borderRadius: 12,
          margin: EdgeInsets.all(12),
          icon: Icon(Icons.info, color: whiteColor, size: 28),);
      },
      leading:icon,
      title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      subtitle: value.isNotEmpty ? Text(value, style: TextStyle(color:blackColor)) : null,
    );
  }
}
