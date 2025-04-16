import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_tab_state.dart';

part 'dashboard_tab_cubit.freezed.dart';

class DashboardTabCubit extends Cubit<DashboardTabState> {
  DashboardTabCubit() : super(const DashboardTabState());

  void onTabSelected(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
