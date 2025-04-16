import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/widgets/charts/dashboard_custom_linear_chart.dart';

class LinearChartCustemContentWidget extends StatelessWidget {
  const LinearChartCustemContentWidget({
    super.key,
    required this.title,
    required this.value,
    required this.percentage,
    required this.dataPoints,
    required this.valueAmount,
    this.isError = false,
  });

  final String title;
  final String value;
  final String percentage;
  final List<double> dataPoints;
  final String valueAmount;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return isError
        ? Column(
          children: [
            Image.asset(
              AppImages.somethingWentWrong,
              height: 100.h,
              width: 100.w,
            ),
            12.verticalSpace,
            BuildText(
              text: context.translate.somethingWentWrong,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              height: 24.sp / 16.sp,
            ),
          ],
        )
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildText(
              text: title,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              height: 24.sp / 16.sp,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DashboardCustomLinearChart(
                    dataPoints: dataPoints,
                    gradientColors: AppColor.kGradientColors2, // optional
                    strokeWidth: 2.5, // optional
                    shadowOffset: 8.0, // optional
                    shadowOpacity: 0.15, // optional
                  ),
                ),
                16.horizontalSpace,
                SizedBox(
                  width: 120.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BuildText(
                            text: value,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            height: 24.sp / 24.sp,
                          ),
                          12.horizontalSpace,
                          Container(
                            padding: EdgeInsets.all(4.r),
                            decoration: BoxDecoration(
                              color: AppColor.kTrendUpBackgroundColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  AppImages.trendUpIconSvg,
                                  width: 16.w,
                                  height: 16.h,
                                ),
                                4.horizontalSpace,
                                BuildText(
                                  text: percentage,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 20.sp / 12.sp,
                                  color: AppColor.kTrendUpTextColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          BuildText(
                            text: context.translate.value,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.kTextDisabledColor,
                            height: 24.sp / 14.sp,
                          ),
                          8.horizontalSpace,
                          BuildText(
                            text: "\$$valueAmount",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.kTextColor,
                            height: 24.sp / 14.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
  }
}
