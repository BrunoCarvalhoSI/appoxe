import 'package:oxesushi_v1/src/constants/endpoints.dart';
import 'package:oxesushi_v1/src/models/user_model.dart';
import 'package:oxesushi_v1/src/pages/auth/repository/auth_errors.dart'
    as authErrors;
import 'package:oxesushi_v1/src/pages/auth/result/auth_result.dart';
import 'package:oxesushi_v1/src/services/http_manager.dart';

class AuthRespositoy {
  final HttpManager _httpManager = HttpManager();

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.validateToken,
        method: HttpMethods.post,
        headers: {
          'X-Parse-REST-API-Key': token,
        });

    if (result["result"] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }
}
