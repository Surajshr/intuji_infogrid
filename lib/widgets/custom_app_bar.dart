import 'package:intuji_infogrid/core/imports/ui_imports.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showBackButton = true,
    this.showSearchButton = true,
    this.showNotificationButton = true,
    this.showProfileButton = true,
    this.onBackButtonPressed,
    this.onSearchButtonPressed,
    this.onProfileButtonPressed,
  });
  final String? title;
  final bool showBackButton;
  final bool showSearchButton;
  final bool showNotificationButton;
  final bool showProfileButton;
  final Function()? onBackButtonPressed;
  final Function()? onSearchButtonPressed;

  final Function()? onProfileButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126.h,
      width: 1.sw,
      color: AppColor.kAccentColor,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showBackButton)
                GestureDetector(
                  onTap: onBackButtonPressed,
                  child: Icon(
                    Icons.arrow_back_sharp,
                    color: AppColor.kWhiteColor,
                  ),
                ),
              if (showBackButton) 16.horizontalSpace,
              BuildText(
                text: title ?? 'Dashboard',
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                height: 28.sp / 20.sp,
                color: AppColor.kWhiteColor,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (showSearchButton)
                GestureDetector(
                  onTap: onSearchButtonPressed,
                  child: SvgPicture.asset(AppImages.searchIconSvg),
                ),
              if (showProfileButton) 16.horizontalSpace,
              if (showProfileButton)
                Container(
                  height: 24,
                  width: .5.w,
                  color: AppColor.kDividerColor,
                ),
              if (showProfileButton) 16.horizontalSpace,
              if (showProfileButton)
                GestureDetector(
                  onTap: onProfileButtonPressed,
                  child: Container(
                    height: 24.h,
                    width: 24.h,
                    decoration: BoxDecoration(
                      color: AppColor.kWhiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(AppImages.profileIcon),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
