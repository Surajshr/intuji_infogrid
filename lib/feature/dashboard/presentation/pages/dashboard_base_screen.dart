import 'package:intuji_infogrid/core/dummy_data/dummy_products.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/product_entity.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/logic/dashboard/dashboard_cubit.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/widgets/custom_container.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/widgets/dashboard_budge_section.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/widgets/dashboard_linear_graph_section.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/widgets/live_order_track_widget.dart';
import 'package:intuji_infogrid/route/app_route.dart';
import 'package:intuji_infogrid/widgets/custom_app_bar.dart';

class DashboardContainScreen extends StatefulWidget {
  const DashboardContainScreen({super.key});

  @override
  State<DashboardContainScreen> createState() => _DashboardContainScreenState();
}

class _DashboardContainScreenState extends State<DashboardContainScreen>
    with AutomaticKeepAliveClientMixin {
  final List<ProductDetailModel> products = getDummyProducts();

  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "Dashboard",
            showBackButton: false,
            showSearchButton: true,
            showProfileButton: true,
            onBackButtonPressed: () => context.popTimes(1),
            onSearchButtonPressed: () {},
            onProfileButtonPressed: () {},
          ),

          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await context.read<DashboardCubit>().init(
                  isFromPullToRefresh: true,
                );
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                child: Column(
                  children: [
                    DashboardLinearGraphSection(),
                    20.verticalSpace,
                    DashboardBudgeSection(),
                    20.verticalSpace,
                    LiveOrderTrackWidget(),
                    20.verticalSpace,
                    BlocSelector<DashboardCubit, DashboardState, int>(
                      selector: (state) {
                        return state.currentPage;
                      },
                      builder: (context, state) {
                        return CustomContainer(
                          title: 'Recently Added Products',
                          description: 'Browse new products from us',
                          child: Column(
                            children: [
                              16.verticalSpace,
                              ProductPageView(products: products),
                              Divider(thickness: .5),
                              12.verticalSpace,
                              // Page Indicator
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 24.w,
                                  right: 24.w,
                                  bottom: 13.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<DashboardCubit>()
                                            .goToPreviousPage();
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios_new,
                                        size: 16.h,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                        products.length,
                                        (index) => Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 4.w,
                                          ),
                                          width: 8.w,
                                          height: 8.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                state == index
                                                    ? AppColor.kLinkTextColor
                                                    : AppColor
                                                        .kPageIndicatorDisableColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<DashboardCubit>()
                                            .goToNextPage();
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ProductPageView extends StatefulWidget {
  const ProductPageView({super.key, required this.products});
  final List<ProductDetailModel> products;

  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: PageView.builder(
        controller: context.read<DashboardCubit>().pageController,
        onPageChanged: (index) {
          context.read<DashboardCubit>().setCurrentPage(index);
        },
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return Container(
            width: 1.sw,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 22.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColor.kProductCardColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  product.images[0],
                  height: 160.h,
                  fit: BoxFit.contain,
                ),
                8.verticalSpace,
                SizedBox(
                  width: .5.sw,
                  child: BuildText(
                    textAlign: TextAlign.center,
                    text: product.name,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                20.verticalSpace,
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.productDetail,
                      arguments: product,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BuildText(
                        text: 'View Product Details',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.kLinkTextColor,
                      ),
                      12.horizontalSpace,
                      SvgPicture.asset(AppImages.arrowVerticalIconSvg),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    context.read<DashboardCubit>().pageController.dispose();
    super.dispose();
  }
}
