import 'package:flutter/services.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/widgets/custom_container.dart';

class LiveOrderTrackWidget extends StatelessWidget {
  const LiveOrderTrackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      title: 'Live Order Tracking',
      description: 'Progress of all orders from placement to delivery',
      child: Column(
        children: [
          8.verticalSpace,
          Image.asset(AppImages.mapPng),
          16.verticalSpace,
          Padding(
            padding: EdgeInsets.only(bottom: 12.h, left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColor.kAccentColor),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Clipboard.setData(
                          const ClipboardData(text: 'OLG-SH-1247896'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Copied to clipboard')),
                        );
                      },
                      child: BuildText(
                        text: 'OLG-SH-1247896',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    8.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: 'OLG-SH-1247896'),
                        );
                      },
                      child: SvgPicture.asset(AppImages.copyIconSvg),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, color: AppColor.kAccentColor),
              ],
            ),
          ),
          Divider(thickness: .5),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
            child: Row(
              children: [
                Expanded(
                  child: AddressWidget(
                    text: 'From',
                    address: '7 Avoca St, Yagoona NSW',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Icon(
                      Icons.arrow_forward_outlined,
                      color: AppColor.kAccentColor,
                    ),
                  ),
                ),
                Expanded(
                  child: AddressWidget(
                    text: 'To',
                    address: '7 Avoca St, Yagoona NSW',
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: .5),
          17.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildText(
                text: 'View Order Details',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.kLinkTextColor,
              ),
              12.horizontalSpace,
              SvgPicture.asset(AppImages.arrowVerticalIconSvg),
            ],
          ),
          18.verticalSpace,
        ],
      ),
    );
  }
}

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key, required this.text, required this.address});
  final String text;
  final String address;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          text: text,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          height: 24.sp / 12.sp,
        ),
        3.verticalSpace,
        BuildText(
          text: address,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.kDisabledTextColor,
          height: 24.sp / 14.sp,
        ),
      ],
    );
  }
}
