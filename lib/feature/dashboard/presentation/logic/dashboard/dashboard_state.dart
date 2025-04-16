part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const DashboardState._();

  const factory DashboardState({
    @Default(null) LinearChartDataEntity? quotesDataPoints,
    @Default(null) LinearChartDataEntity? ordersDataPoints,
    @Default(null) BudgetEntity? budget,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default(false) bool isQuotesDataError,
    @Default(false) bool isOrdersDataError,
    @Default(false) bool isBudgetError,
    @Default(0) int currentPage,
  }) = _DashboardState;

  @override
  LinearChartDataEntity? get quotesDataPoints => throw UnimplementedError();

  @override
  LinearChartDataEntity? get ordersDataPoints => throw UnimplementedError();

  @override
  BudgetEntity? get budget => throw UnimplementedError();

  @override
  bool get isError => throw UnimplementedError();

  @override
  bool get isLoading => throw UnimplementedError();

  @override
  bool get isBudgetError => throw UnimplementedError();

  @override
  bool get isOrdersDataError => throw UnimplementedError();

  @override
  bool get isQuotesDataError => throw UnimplementedError();

  @override
  int get currentPage => throw UnimplementedError();
}
