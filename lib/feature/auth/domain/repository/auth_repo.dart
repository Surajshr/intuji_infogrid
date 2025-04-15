import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<String, String>> login(String email, String password);
}
