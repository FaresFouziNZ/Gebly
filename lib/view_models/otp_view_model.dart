import 'package:gebly/core/services/authentication_services.dart';
import 'package:gebly/core/services/database_queries.dart';

class OtpViewModel {
  String _otpCode = '';

  String get otpCode => _otpCode;

  void setOtpCode(String code) {
    _otpCode = code;
  }

  bool isOtpValid(String code) {
    if (code.length != 4) {
      return false;
    }
    return true;
  }

  Future<bool> verifyOtp({required String code, required String phoneNumber}) async {
    return await AuthenticationServices().verifyOtp(phone: '+966${phoneNumber.substring(1)}', code: code);
  }

  Future<void> resendOtp({required String phoneNumber}) async {
    await AuthenticationServices().signInWithOtp(phone: phoneNumber);
  }

  Future<bool> isUserExist() async {
    return await DatabaseServices().isUserExist();
  }
}
