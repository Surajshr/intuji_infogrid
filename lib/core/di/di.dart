import 'package:get_it/get_it.dart';
import 'package:intuji_infogrid/core/services/network_service/client/base_client.dart';
import 'package:intuji_infogrid/core/services/network_service/client/base_client_implementation.dart';
import 'package:intuji_infogrid/core/services/storage_service/storage_service.dart';
import 'package:intuji_infogrid/feature/auth/data/repository_impl/auth_repo_impl.dart';
import 'package:intuji_infogrid/feature/auth/domain/repository/auth_repo.dart';
import 'package:intuji_infogrid/feature/auth/domain/usecases/auth_usecase.dart';
import 'package:intuji_infogrid/feature/dashboard/data/repository_impl/dashboard_repository_impl.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/repository/dashboard_repository.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/usecase/dashboard_usecase.dart';

final GetIt di = GetIt.instance;

Future<void> initDependencies() async {
  di.registerSingleton<StorageService>(StorageService());
  di.registerFactory<BaseClient>(BaseClientImpl.new);
  di.registerSingleton<AuthRepo>(AuthRepoImpl(di<BaseClient>()));
  di.registerSingleton<AuthUsecase>(AuthUsecase(di<AuthRepo>()));
  di.registerSingleton<DashboardRepository>(DashboardRepositoryImpl());
  di.registerSingleton<DashboardUsecase>(
    DashboardUsecase(di<DashboardRepository>()),
  );
}
