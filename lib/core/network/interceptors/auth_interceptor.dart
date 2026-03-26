import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthInterceptor extends Interceptor {
  AuthInterceptor() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) async {
      if (user != null) {
        _cachedToken = await user.getIdToken();
      } else {
        _cachedToken = null;
      }
    });
  }

  String? _cachedToken;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requiresToken = options.extra['requiresToken'] ?? true;

    if (requiresToken && _cachedToken != null) {
      options.headers['Authorization'] = 'Bearer $_cachedToken';
    }

    super.onRequest(options, handler);
  }
}
