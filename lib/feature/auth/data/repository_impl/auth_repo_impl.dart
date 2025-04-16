import 'package:dartz/dartz.dart';
import 'package:intuji_infogrid/core/services/network_service/client/base_client.dart';
import 'package:intuji_infogrid/core/utils/auth_utils.dart';
import 'package:intuji_infogrid/feature/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final BaseClient _client;

  AuthRepoImpl(this._client);

  /*
  If we actually use the API then we can use the following code
  but for now we are using the mock data so we need to return the mock data
   */
  //@override
  // Future<Either<LoginEntity, Failure>> login(String email, String password) async {
  //   final response = await _client.postRequest(
  //     path: '/auth/login',
  //     data: {'email': email, 'password': password},
  //   );
  //   return getParsedData(response, LoginEntity.fromJson);
  // }

  @override
  Future<Either<String, String>> login(String email, String password) async {
    final result = validateCredentials(email, password);
    return result.fold((error) => Left(error), (token) => Right(token));
  }
}
