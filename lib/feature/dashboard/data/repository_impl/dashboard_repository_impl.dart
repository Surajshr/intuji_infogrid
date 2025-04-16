import 'package:dartz/dartz.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/budge_entity.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/linear_chart_data_entity.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/repository/dashboard_repository.dart';
import 'dart:math';

class DashboardRepositoryImpl extends DashboardRepository {
  List<double> _generateRandomDoubleDataPoints() {
    final random = Random();
    return List.generate(11, (index) => random.nextDouble() * 0.9);
  }

  String _generateRandomValue() {
    final random = Random();
    return (random.nextInt(900) + 100).toString();
  }

  String _generateRandomPercentage() {
    final random = Random();
    return '${random.nextInt(100) + 1}%';
  }

  String _generateRandomAmount() {
    final random = Random();
    return (random.nextInt(9000) + 1000).toString();
  }

  @override
  Future<Either<String, LinearChartDataEntity>> getOutletData() async {
    /*
      We are returning random error to showcase error state in the UI. case we 
      are using mock data and error case will not occoure so randamly passed the 
      error case to showcase the error state in the UI.
      In practical case we will remove this check and return the data always.
    */
    if (Random().nextDouble() < 0.4) {
      return const Left('Failed to fetch outlet data');
    }

    return Right(
      LinearChartDataEntity(
        title: 'Outlets',
        value: _generateRandomValue(),
        percentage: _generateRandomPercentage(),
        dataPoints: _generateRandomDoubleDataPoints(),
        valueAmount: _generateRandomAmount(),
      ),
    );
  }

  @override
  Future<Either<String, LinearChartDataEntity>> getOrdersData() async {
    /*
      We are returning random error to showcase error state in the UI. case we 
      are using mock data and error case will not occoure so randamly passed the 
      error case to showcase the error state in the UI.
      In practical case we will remove this check and return the data always.
    */
    if (Random().nextDouble() < 0.4) {
      return const Left('Failed to fetch outlet data');
    }
    return Right(
      LinearChartDataEntity(
        title: 'Orders',
        value: _generateRandomValue(),
        percentage: _generateRandomPercentage(),
        dataPoints: _generateRandomDoubleDataPoints(),
        valueAmount: _generateRandomAmount(),
      ),
    );
  }

  @override
  Future<Either<String, BudgetEntity>> getBudget() async {
    return Right(
      BudgetEntity(
        totalBudget: 1000,
        totalBudgetUsed: 100,
        totalBudgetRemaining: 900,
      ),
    );
  }
}
