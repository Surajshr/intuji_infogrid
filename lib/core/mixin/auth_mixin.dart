import 'package:intuji_infogrid/core/constants/storage_constant.dart';
import 'package:intuji_infogrid/core/di/di.dart';
import 'package:intuji_infogrid/core/services/storage_service/storage_service.dart';

mixin AuthMixin {
  Future<bool> get isUserLoggedIn async {
    return AuthMixin.isUserLoggedInStatic;
  }

  static Future<bool> get isUserLoggedInStatic async {
    final accessToken = await di<StorageService>().readString(
      StorageConstants.kAccessToken,
    );
    return accessToken != null && accessToken.isNotEmpty;
  }
}
