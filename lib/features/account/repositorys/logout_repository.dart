import 'package:firebase_auth/firebase_auth.dart';

class LogOutRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
