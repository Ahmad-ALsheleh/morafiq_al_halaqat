import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userName = 'أحمد الشلح'.obs;
  var phoneNumber = '+905376721597'.obs;
  var email = 'ahmadzeadalsheleh@gmail.com'.obs;


  void logout() {
    Get.offAllNamed('/login');
  }
}
