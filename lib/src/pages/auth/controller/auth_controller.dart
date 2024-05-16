import 'package:get/get.dart';
import 'package:oxesushi_v1/src/models/user_model.dart';
import 'package:oxesushi_v1/src/pages/auth/repository/auth_repository.dart';
import 'package:oxesushi_v1/src/pages/auth/result/auth_result.dart';
import 'package:oxesushi_v1/src/pages_routes/app_pages.dart';
import 'package:oxesushi_v1/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final authRepository = AuthRespositoy();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  Future<void> validateToken() async {
    //Recuperar o Token
    // authRepository.validateToken(token);
  }

  Future<void> signIn({required email, required password}) async {
    isLoading.value = true;
    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(success: (user) {
      this.user = user;
      Get.offAllNamed(PagesRoutes.baseRoute);
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }
}
