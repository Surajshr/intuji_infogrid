import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intuji_infogrid/core/constants/storage_constant.dart';
import 'package:intuji_infogrid/core/di/di.dart';
import 'package:intuji_infogrid/core/services/storage_service/storage_service.dart';
import 'package:intuji_infogrid/core/utils/auth_utils.dart';
import 'package:intuji_infogrid/core/utils/print_utils.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);

  Future<void> checkUser() async {
    final token = await di<StorageService>().readString(
      StorageConstants.kAccessToken,
    );
    PrintUtil.printLog(message: token ?? 'null', tag: 'appToken');
    if (token != null) {
      final canTokenBeUsed = isTokenValid(token);

      if (canTokenBeUsed) {
        emit(true);
      } else {
        await di<StorageService>().deleteString(StorageConstants.kAccessToken);
        emit(false);
      }
    } else {
      emit(false);
    }
  }
}
