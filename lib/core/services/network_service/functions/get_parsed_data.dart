import 'package:intuji_infogrid/core/services/network_service/network_imports.dart';

List<int> successStatusCodes = [200, 201, 202, 204];

Future<Either<T, Failure>> getParsedData<T>(
  Response? response,
  T Function(Map<String, dynamic>) fromJson,
) async {
  if (response != null && successStatusCodes.contains(response.statusCode)) {
    PrintUtil.printLog(
      tag: 'response data on parsing',
      message: '${response.data}',
    );
    //handle success here
    if (response.data is Map<String, dynamic>) {
      try {
        final result = fromJson(response.data as Map<String, dynamic>);

        return Left(result);
      } catch (e) {
        return Right(Failure.fromJson(response.data as Map<String, dynamic>));
      }
    } else if (response.statusCode == 204) {
      // status code 204 means success but no response data
      return Left(fromJson(response.data as Map<String, dynamic>));
    } else {
      return Right(Failure.fromJson(response.data as Map<String, dynamic>));
    }
  } else {
    return Right(
      Failure.fromJson(response?.data as Map<String, dynamic> ?? {}),
    );
  }
}
