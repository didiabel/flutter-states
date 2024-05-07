import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutterstates/apis/api_credentials.dart';
import 'package:flutterstates/apis/aurh_interceptor.dart';
import 'package:flutterstates/common/local_storage.dart';
import 'package:flutterstates/models/session.dart';

class APICall {
  late final APICredentials apiCredentials;
  static final APICall instance = APICall._();
  String accessToken = '';
  late Dio dio;

  APICall._() {
    dio = Dio();
    dio.options.baseUrl = APICredentials.baseUrl;
    dio.interceptors.add(AuthInterceptor(APICredentials.apiKey, refreshToken));
  }

  void setToken(String authToken) {
    final authInterceptor = dio.interceptors
        .firstWhere((element) => element is AuthInterceptor) as AuthInterceptor;
    authInterceptor.setToken(authToken);

    accessToken = authToken;
  }

  Future<Response> refreshToken(RequestOptions requestOptions) async {
    final resp = await dio.get('auth/refresh-token');

    final currentSession = await LocalStorage().getSession();

    final session = Session.fromMap(
        {"user": currentSession?.user.toMap(), "token": resp.data['token']});

    setToken(session.token);
    LocalStorage().getSession();

    return await dio.fetch(requestOptions);
  }

  Future<int> verifyEmail(String email) async {
    // final resp = await dio.post('user/validate-email', data: {'email': email});

    // return resp.data["status"];
    return 1;
  }

  Future sendEmailConfirmation(String email) async {
    await dio.post<int>('user/resend-email', data: {'email': email});
  }

  Future<Map<String, dynamic>> signUp(String email, String password) async {
    final resp = await dio.put('user/sign-up', data: {
      "email": email,
      "password": password,
    });

    Session? session;
    if (resp.data['user'] != null) {
      session = Session.fromMap(resp.data);
      setToken(session.token);
    }
    return {
      'user': 'user',
    };
  }

  Future<Session> signIn(String email, String password) async {
    final resp = await dio.post('auth/sign-in/user',
        data: {'email': email, "password": password});

    final response = Session.fromMap(resp.data);
    setToken(response.token);

    return response;
  }

  Future sendForgotPasswordEmail(String email) async {
    await dio.post('auth/send-forgot-email/user', data: {'email': email});
  }

  Future recoverPassword(String email, String password, String code) async {
    await dio.put('auth/reset-password/user', data: {
      'email': email,
      'password': password,
      'code': code,
    });
  }

  Future<Map<String, dynamic>> getAppVersions() async {
    final FirebaseRemoteConfig remoteConfig =
        await FirebaseRemoteConfig.instance;

    try {
      // Fetch remote config values
      await remoteConfig.fetch();
      await remoteConfig.activate();

      // Access the remote config values
      final lastBuildNumber = remoteConfig.getInt('last_build_number');
      final minimumBuildNumber = remoteConfig.getInt('minimum_build_number');

      return {
        'last_build_number': lastBuildNumber,
        'minimum_build_number': minimumBuildNumber,
      };
    } catch (exception) {
      // Handle any errors that occur during fetching or activation
      print('Error fetching Remote Config: $exception');
      return {
        'last_build_number': null,
        'minimum_build_number': null,
      };
    }
  }
}
