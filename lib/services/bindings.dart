import 'package:flutterstates/services/auth_service.dart';
import 'package:flutterstates/services/core/injector.dart';
import 'package:flutterstates/services/interfaces/iauth_service.dart';

class Bindings {
  static void register() {
    Injector.register<IAuthService>(() => AuthService());
  }
}
