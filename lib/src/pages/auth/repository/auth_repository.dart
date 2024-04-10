import 'package:oxesushi_v1/src/constants/endpoints.dart';
import 'package:oxesushi_v1/src/services/http_manager.dart';

class AuthRespositoy {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result['result'] != null) {
      print('funcionou');
    }else{
      print(result['error']);
    }
  }
}
