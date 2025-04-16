import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/product_entity.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/logic/dashboard/dashboard_cubit.dart';
import 'package:intuji_infogrid/feature/product_detail/presentation/logic/product_detail_cubit.dart';
import 'package:intuji_infogrid/widgets/custom_app_bar.dart';

class ProductDetailBaseView extends StatefulWidget {
  const ProductDetailBaseView({super.key, required this.product});
  final ProductDetailModel product;

  @override
  State<ProductDetailBaseView> createState() => _ProductDetailBaseViewState();
}

class _ProductDetailBaseViewState extends State<ProductDetailBaseView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductDetailCubit>().getRemainingBudget(
      remainingBudget: context.read<DashboardCubit>().getRemainingBudget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "Product ",
            showBackButton: true,
            showSearchButton: false,
            showProfileButton: false,
            onBackButtonPressed: () {
              Navigator.pop(context);
            },
          ),
          BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: SizedBox(
                            height: 180.h,
                            child: PageView.builder(
                              controller:
                                  context
                                      .read<ProductDetailCubit>()
                                      .pageController,
                              onPageChanged: (index) {
                                context
                                    .read<ProductDetailCubit>()
                                    .setCurrentPage(index);
                              },
                              itemCount: widget.product.images.length,
                              itemBuilder: (context, index) {
                                final product = widget.product.images[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      product,
                                      height: 160.h,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              widget.product.images.length,
                              (index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                width: 8.w,
                                height: 8.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      state.currentPage == index
                                          ? AppColor.kAccentColor
                                          : AppColor
                                              .kProductDetailIndicatorDisableColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        12.verticalSpace,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BuildText(
                              text: '\$${widget.product.price}',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                              height: 32.sp / 24.sp,
                            ),
                            14.horizontalSpace,
                            Stack(
                              children: [
                                SvgPicture.asset(
                                  AppImages.arrowLeftIconSvg,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                    ),
                                    color: AppColor.kTrendUpTextColor,
                                    child: Row(
                                      children: [
                                        BuildText(
                                          text: '${state.remainingBudget}',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w800,
                                          height: 24.sp / 12.sp,
                                          color: AppColor.kWhiteColor,
                                        ),
                                        BuildText(
                                          text: ' left in your current budget.',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          height: 24.sp / 12.sp,
                                          color: AppColor.kWhiteColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        5.verticalSpace,
                        BuildText(
                          text: widget.product.name,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        5.verticalSpace,
                        BuildText(
                          text: widget.product.description,
                          fontSize: 16.sp,
                          height: 24.sp / 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.kProductDetailTitleColor,
                        ),

                        15.verticalSpace,
                        BuildText(
                          text: 'Color',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        7.verticalSpace,
                        SizedBox(
                          height: 30.h,
                          child: ListView.builder(
                            itemCount: widget.product.availableColors.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<ProductDetailCubit>()
                                      .onColorSelected(
                                        widget
                                            .product
                                            .availableColors[index]
                                            .hexCode,
                                        index,
                                      );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: Container(
                                    width: 34.r,
                                    height: 34.r,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.kWhiteColor,
                                      border: Border.all(
                                        width: 2.w,
                                        color:
                                            state.selectedColorIndex == index
                                                ? AppColor.kLinkTextColor
                                                : AppColor
                                                    .kProductDetailBorderColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Center(
                                        child: Container(
                                          width: 30.r,
                                          height: 30.r,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                widget
                                                    .product
                                                    .availableColors[index]
                                                    .hexCode,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        15.verticalSpace,
                        BuildText(
                          text: 'Available Sizes',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        7.verticalSpace,
                        SizedBox(
                          height: 40.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.product.availableSizes.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<ProductDetailCubit>()
                                      .onSizeSelected(
                                        widget.product.availableSizes[index],
                                        index,
                                      );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 6.w),
                                  width: 40.r,
                                  height: 40.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        state.selectedSizeIndex == index
                                            ? AppColor.kWhiteColor
                                            : Colors.transparent,
                                    border: Border.all(
                                      width: 2.w,
                                      color:
                                          state.selectedSizeIndex == index
                                              ? AppColor.kLinkTextColor
                                              : AppColor
                                                  .kProductDetailBorderColor,
                                    ),
                                  ),

                                  child: Align(
                                    alignment: Alignment.center,
                                    child: BuildText(
                                      text:
                                          widget
                                              .product
                                              .availableSizes[index]
                                              .name,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        15.verticalSpace,
                      ],
                    ),
                  ),
                  Container(
                    width: 1.sw,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    // height: 50.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: AppColor.kGradientColors,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildText(
                          text: 'You last requested this product on ',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: 24.sp / 14.sp,
                          // color: AppColor.kWhiteColor,
                        ),
                        BuildText(
                          text: 'January 7, 2024',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          height: 24.sp / 14.sp,
                          // color: AppColor.kWhiteColor,
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: AppButton(
                      elevation: 16,
                      text: 'Send Order Request',
                      onPressed: () {},
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
