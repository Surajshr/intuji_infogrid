import 'package:intuji_infogrid/core/imports/ui_imports.dart';

void showCustomDialogBox(
  BuildContext context, {
  required String imageUrl,
  required String text,
  bool isDismissible = false,
  required VoidCallback onPressed,
}) {
  showDialog(
    barrierDismissible: isDismissible,
    context: context,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: AppColor.kWhiteColor,
          insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.kWhiteColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    height: .3.sh,
                    width: 1.sw,
                    padding: EdgeInsets.symmetric(
                      horizontal: 45.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.kWhiteColor,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: SvgPicture.asset(imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                ),
                // 12.verticalSpace,
                BuildText(
                  text: text,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                24.verticalSpace,
                AppButton(text: 'Ok', onPressed: onPressed),
              ],
            ),
          ),
        ),
      );
    },
  );
}
