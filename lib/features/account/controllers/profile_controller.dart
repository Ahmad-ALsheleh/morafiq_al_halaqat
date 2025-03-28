  import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

  class ProfileController extends GetxController {
    var email = 'ahmadzeadalsheleh@gmail.com'.obs;
    var password = '*******'.obs;

    @override
    void onInit() {
      super.onInit();
      getUserData();
    }

    void getUserData() {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        email.value = user.email ?? "لا يوجد بريد إلكتروني";
      }
    }

  }