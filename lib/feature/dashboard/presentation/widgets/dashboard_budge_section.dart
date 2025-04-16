import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/budge_entity.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/logic/dashboard/dashboard_cubit.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/widgets/charts/custom_gudge_painter.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/widgets/custom_container.dart';

class DashboardBudgeSection extends StatelessWidget {
  const DashboardBudgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DashboardCubit, DashboardState, BudgetEntity?>(
      selector: (state) => state.budget,
      builder: (context, budge) {
        if (budge == null) {
          return const SizedBox.shrink();
        }
        return CustomContainer(
          title: 'Budget Overview',
          description: 'Summary of the budget plan for November',
          child: Column(
            children: [
              40.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: GaugeMeter(
                  value: 0.7,
                  amount: '\$${budge.totalBudget}',
                  label: 'Total Budget Spent',
                  width: .5.sw,
                  height: 160.h,
                ),
              ),
              25.verticalSpace,
              Divider(thickness: .5),
              16.verticalSpace,
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: 'You still have ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.kTextDisabledColor2,
                      ),
                      children: [
                        TextSpan(
                          text: '\$${budge.totalBudgetRemaining}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.kTextColor,
                          ),
                        ),
                        TextSpan(
                          text: ' left in your budget.',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.kTextDisabledColor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
