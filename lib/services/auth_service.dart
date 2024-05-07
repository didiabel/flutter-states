import 'package:flutterstates/apis/api_call.dart';
import 'package:flutterstates/common/local_storage.dart';
import 'package:flutterstates/models/session.dart';
import 'package:flutterstates/models/user.dart';
import 'package:flutterstates/services/interfaces/iauth_service.dart';

class AuthService extends IAuthService {
  final LocalStorage _localStorage = LocalStorage();

  @override
  late Session session;

  AuthService() {
    initialize();
  }

  void initialize() async {
    final s = await _localStorage.getSession();
    if (s != null) {
      session = s;
    }
  }

  @override
  Future<User> signIn(String email, String password) async {
    Session userSession = await APICall.instance.signIn(email, password);

    session = userSession;

    _localStorage.saveItem(StorageKey.session, userSession);
    _localStorage.saveSecureItem(StorageKey.userPassword, password);

    return session.user;
  }

  @override
  Future<void> sendForgotPasswordEmail(String email) async {
    await APICall.instance.sendForgotPasswordEmail(email);
  }

  @override
  Future<void> recoverPassword(
    String email,
    String password,
    String code,
  ) async {
    return await APICall.instance.recoverPassword(email, password, code);
  }

  @override
  Future<User> updateUser(User user) async {
    // TODO:
    return session.user;
  }

  @override
  Future<Map<String, dynamic>> getAppVersions() async {
    return await APICall.instance.getAppVersions();
  }
}
