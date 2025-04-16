part of 'dashboard_tab_cubit.dart';

@freezed
class DashboardTabState with _$DashboardTabState {
  const DashboardTabState._();

  const factory DashboardTabState({@Default(0) int selectedIndex}) =
      _DashboardTabState;

  @override
  int get selectedIndex => throw UnimplementedError();
}
