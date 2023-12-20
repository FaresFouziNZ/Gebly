import 'package:flutter_test/flutter_test.dart';
import 'package:gebly/core/services/authentication_services.dart';

void main() {
  group('Authentication Services Tests', () {
    test('Login with correct credentials', () async {
      final authService = AuthenticationServices();
      var result = await authService.signInWithEmailAndPassword(
          email: 'Abdulrahman-azhar@hotmail.com', password: 'Gebly');
      expect(result, true);
    });

    test('Login with incorrect credentials', () async {
      final authService = AuthenticationServices();
      var result = await authService.signInWithEmailAndPassword(
          email: 'testuser@gmai.com', password: 'testpass');
      expect(result, false);
    });
  });
}
