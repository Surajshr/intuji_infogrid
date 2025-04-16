import 'package:intuji_infogrid/core/imports/ui_imports.dart';

class TabBox extends StatelessWidget {
  const TabBox({
    required this.isActive,
    required this.icon,
    super.key,
    required this.label,
  });

  final bool isActive;
  final Widget icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
      child: Container(
        width: 64.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: isActive ? AppColor.kPrimaryColorLight : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(4.h), child: icon),
            BuildText(
              text: label,
              color:
                  isActive
                      ? AppColor.kAccentColor
                      : AppColor.kDisabledColorDark,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              height: 16.sp / 10.sp,
            ),
          ],
        ),
      ),
    );
  }
}
