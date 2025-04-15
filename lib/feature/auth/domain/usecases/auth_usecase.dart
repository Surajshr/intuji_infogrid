import 'package:dartz/dartz.dart';
import 'package:intuji_infogrid/feature/auth/domain/repository/auth_repo.dart';

class AuthUsecase {
  final AuthRepo _authRepo;

  AuthUsecase(this._authRepo);

  Future<Either<String, String?>> login(String email, String password) async {
    return _authRepo.login(email, password);
  }
}
