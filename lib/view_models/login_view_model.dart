import 'package:gebly/core/services/authentication_services.dart';

class LoginViewModel {
  bool isNumberValid({required String number}) {
    if (number.length != 10) {
      return false;
    }
    return true;
  }

  void signIn({required String number}) async {
    final phone = '+966${number.substring(1)}';
    await AuthenticationServices().signInWithOtp(phone: phone);
  }
}
