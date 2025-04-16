import 'package:dartz/dartz.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/budge_entity.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/linear_chart_data_entity.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/repository/dashboard_repository.dart';

class DashboardUsecase {
  final DashboardRepository _dashboardRepository;

  DashboardUsecase(this._dashboardRepository);

  Future<Either<String, LinearChartDataEntity>> getOutletData() async {
    return await _dashboardRepository.getOutletData();
  }

  Future<Either<String, LinearChartDataEntity>> getOrdersData() async {
    return await _dashboardRepository.getOrdersData();
  }

  Future<Either<String, BudgetEntity>> getBudget() async {
    return await _dashboardRepository.getBudget();
  }
}
