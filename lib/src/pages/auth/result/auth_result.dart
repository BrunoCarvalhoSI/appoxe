import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oxesushi_v1/src/pages/auth/repository/auth_repository.dart';

import '../../../models/user_model.dart';

part 'auth_result.freezed.dart';

@freezed
class AuthResult with _$AuthResult {
  factory AuthResult.success(UserModel user) = Success;

  factory AuthResult.error(String messagem) = Error;
}
