import 'package:intuji_infogrid/core/constants/storage_constant.dart';
import 'package:intuji_infogrid/core/di/di.dart';
import 'package:intuji_infogrid/core/services/storage_service/storage_service.dart';

Future<Map<String, String>> getHeader({
  bool requiresAuthorization = true,
  bool contentTypeIsMultiPart = false,
  bool setContentType = true,
}) async {
  String? token = await di<StorageService>().readString(
    StorageConstants.kAccessToken,
  );

  return {
    if (setContentType)
      "Content-Type":
          contentTypeIsMultiPart ? "multipart/form-data" : "application/json",
    if (token != null && requiresAuthorization)
      "Authorization": "Bearer $token",
  };
}
