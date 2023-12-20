import 'package:gebly/core/models/database_user.dart';
import 'package:gebly/core/services/authentication_services.dart';
import 'package:gebly/core/services/database_queries.dart';

class SignUpViewModel {
  Future<bool> signUp({required String fName, required String lName, required String phoneNumber}) async {
    final currentUser = AuthenticationServices().currentUser;
    final user = DatabaseUser(
      id: currentUser!.id,
      firstName: fName,
      lastName: lName,
      mobileNumber: '+966${phoneNumber.substring(1)}',
    );
    return await DatabaseServices().createUser(user: user);
  }

  bool isDataValid(
      {required String fName, required String lName, required bool isAgreed, required String phoneNumber}) {
    if (fName.isEmpty || lName.isEmpty || !isAgreed || phoneNumber.length != 10) {
      return false;
    }
    return true;
  }
}
