import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/logic/dashboard/dashboard_cubit.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/widgets/charts/linear_chart_custom_content_widget.dart';
import 'package:intuji_infogrid/widgets/dashboard_shimmer.dart';

class DashboardLinearGraphSection extends StatelessWidget {
  const DashboardLinearGraphSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const DashboardShimmer();
        }
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              width: 1.sw,
              decoration: BoxDecoration(
                color: AppColor.kWhiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  LinearChartCustemContentWidget(
                    title: context.translate.totalQuotes,
                    value: state.quotesDataPoints?.value ?? "0",
                    percentage: state.quotesDataPoints?.percentage ?? "0%",
                    dataPoints: state.quotesDataPoints?.dataPoints ?? [],
                    valueAmount: state.quotesDataPoints?.valueAmount ?? "0",
                    isError: state.isQuotesDataError,
                  ),
                  16.verticalSpace,
                  Divider(thickness: .5),
                  24.verticalSpace,
                  LinearChartCustemContentWidget(
                    title: context.translate.totalOrders,
                    value: state.ordersDataPoints?.value ?? "0",
                    percentage: state.ordersDataPoints?.percentage ?? "0%",
                    dataPoints: state.ordersDataPoints?.dataPoints ?? [],
                    valueAmount: state.ordersDataPoints?.valueAmount ?? "0",
                    isError: state.isOrdersDataError,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
