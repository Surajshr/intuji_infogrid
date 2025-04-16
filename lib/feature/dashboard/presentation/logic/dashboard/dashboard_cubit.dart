import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intuji_infogrid/core/di/di.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/budge_entity.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/linear_chart_data_entity.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/usecase/dashboard_usecase.dart';

part 'dashboard_state.dart';

part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  final DashboardUsecase dashboardUsecase = di<DashboardUsecase>();
  final PageController pageController = PageController();

  Future<void> init({bool isFromPullToRefresh = false}) async {
    if (state.quotesDataPoints == null || isFromPullToRefresh) {
      await getOutletData();
    }
    if (state.ordersDataPoints == null || isFromPullToRefresh) {
      await getOrdersData();
    }
    if (state.budget == null || isFromPullToRefresh) {
      await getBudget();
    }
  }

  Future<void> getOutletData() async {
    try {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(const Duration(seconds: 1));
      final result = await dashboardUsecase.getOutletData();
      result.fold(
        (error) => emit(
          state.copyWith(
            quotesDataPoints: null,
            isLoading: false,
            isQuotesDataError: true,
          ),
        ),
        (data) => emit(
          state.copyWith(
            quotesDataPoints: data,
            isLoading: false,
            isQuotesDataError: false,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          quotesDataPoints: null,
          isLoading: false,
          isQuotesDataError: true,
        ),
      );
    }
  }

  Future<void> getOrdersData() async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await dashboardUsecase.getOrdersData();
      result.fold(
        (error) => emit(
          state.copyWith(
            ordersDataPoints: null,
            isLoading: false,
            isOrdersDataError: true,
          ),
        ),
        (data) => emit(
          state.copyWith(
            ordersDataPoints: data,
            isLoading: false,
            isOrdersDataError: false,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          ordersDataPoints: null,
          isLoading: false,
          isOrdersDataError: true,
        ),
      );
    }
  }

  Future<void> getBudget() async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await dashboardUsecase.getBudget();
      result.fold(
        (error) => emit(
          state.copyWith(budget: null, isLoading: false, isBudgetError: true),
        ),
        (data) => emit(
          state.copyWith(budget: data, isLoading: false, isBudgetError: false),
        ),
      );
    } catch (e) {
      emit(state.copyWith(budget: null, isLoading: false, isBudgetError: true));
    }
  }

  double getRemainingBudget() {
    return state.budget?.totalBudgetRemaining ?? 0;
  }

  void setCurrentPage(int page) {
    emit(state.copyWith(currentPage: page));
  }

  void goToNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goToPreviousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
