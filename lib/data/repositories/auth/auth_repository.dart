import 'package:cinebox_flutter/core/result/result.dart';

abstract interface class AuthRepository {
  Future<Result<Unit>> signIn();
  Future<Result<Unit>> signOu();
  Future<Result<bool>> isLogged();
}
