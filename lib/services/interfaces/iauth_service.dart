import 'package:flutterstates/models/session.dart';
import 'package:flutterstates/models/user.dart';

abstract class IAuthService {
  Future<User?> signIn(String email, String password);
  Future<void> sendForgotPasswordEmail(String email);
  Future<void> recoverPassword(String email, String password, String code);
  Future<User> updateUser(User user);
  Session get session;
  Future<Map<String, dynamic>> getAppVersions();
}
