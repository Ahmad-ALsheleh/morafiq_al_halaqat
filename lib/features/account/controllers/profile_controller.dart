import 'package:get/get.dart';

import '../repositorys/profile_repository.dart';

class ProfileController extends GetxController {
  final ProfileRepository _repository = ProfileRepository();

  var email = 'غير مسجل'.obs;
  var password = '*******'.obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  void getUserData() {
    final user = _repository.getCurrentUser();
    email.value = user?.email ?? "لا يوجد بريد إلكتروني";
  }
}