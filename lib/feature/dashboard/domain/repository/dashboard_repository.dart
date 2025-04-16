import 'package:dartz/dartz.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/budge_entity.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/linear_chart_data_entity.dart';

abstract class DashboardRepository {
  Future<Either<String, LinearChartDataEntity>> getOutletData();
  Future<Either<String, LinearChartDataEntity>> getOrdersData();
  Future<Either<String, BudgetEntity>> getBudget();
}
