import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userName = 'عبد الكريم الحاج خلوف'.obs;
  var phoneNumber = '+18629350207'.obs;
  var email = 'jfthamousestate@gmail.com'.obs;

  void updateProfile(String newName, String newPhone, String newEmail) {
    userName.value = newName;
    phoneNumber.value = newPhone;
    email.value = newEmail;
  }

  void logout() {
    // هنا يمكن تنفيذ عمليات تسجيل الخروج مثل مسح بيانات المستخدم أو الانتقال لشاشة تسجيل الدخول
    Get.offAllNamed('/login');
  }
}
