import 'package:get/get.dart';
import 'package:oxesushi_v1/src/pages/auth/repository/auth_repository.dart';
import 'package:oxesushi_v1/src/services/http_manager.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final authRepository = AuthRespositoy();

  Future<void> signIn({required email, required password}) async {
    isLoading.value = true;
    await authRepository.signIn(email: email, password: password);
    isLoading.value = false;
  }
}
