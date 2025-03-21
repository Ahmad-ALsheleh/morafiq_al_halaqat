import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:morafiq_al_halaqat/core/constant.dart';

class CreateAccountController extends GetxController {
  var isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createAccount(String email, String password) async {
    try {
      isLoading.value = true;
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
print(credential);

      Get.snackbar("نجاح", "تم إنشاء الحساب بنجاح!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: praimaryColor);
      Get.offNamed('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar("خطأ", "هذا البريد مسجل مسبقًا",
            snackPosition: SnackPosition.TOP,
            backgroundColor: praimaryColor);
      } else {
        Get.snackbar("خطأ", "حدث خطأ أثناء التسجيل",
            snackPosition: SnackPosition.TOP,
            backgroundColor: praimaryColor);
        print('_______________________________________________');
        print(e);
      }
    } catch (e) {
      Get.snackbar("خطأ غير متوقع", e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: praimaryColor);
    } finally {
      isLoading.value = false;
    }
  }
}
