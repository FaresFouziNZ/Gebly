import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationServices {
  final auth = Supabase.instance.client.auth;

  User? get currentUser => auth.currentUser;


  //create provider for authentication
  Future<bool> signUp({required String email, required String password}) async {
    AuthResponse response = await auth.signUp(email: email, password: password);
    if (response.user == null) {
      throw Exception();
    }
    return true;
  }

  Future<bool> signInWithEmailAndPassword({required String email, required String password}) async {
    AuthResponse response = await auth.signInWithPassword(password: password, email: email);
    if (response.user == null) {
      throw Exception();
    }
    return true;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
