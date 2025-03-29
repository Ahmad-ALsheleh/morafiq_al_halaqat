import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createAccount(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "حدث خطأ أثناء التسجيل";

      if (e.code == 'email-already-in-use') {
        errorMessage = "هذا البريد مسجل مسبقًا";
      } else if (e.code == 'weak-password') {
        errorMessage = "كلمة المرور ضعيفة جدًا. يرجى استخدام كلمة أقوى.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "يرجى إدخال بريد إلكتروني صالح.";
      }

      throw errorMessage;
    } catch (e) {
      throw "حدث خطأ غير متوقع: ${e.toString()}";
    }
  }
}
