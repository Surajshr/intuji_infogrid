import 'package:flutter/widgets.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.title,
    required this.description,
    this.child,
  });
  final String title;
  final String description;
  final Widget? child;
  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      //
      decoration: BoxDecoration(
        color: AppColor.kWhiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildText(
                  text: widget.title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),

                BuildText(
                  text: widget.description,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 20.sp / 14.sp,
                ),
              ],
            ),
          ),
          widget.child ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
