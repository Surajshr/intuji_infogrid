import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/members/domain/entities/member_detail_entities.dart';

class MemberCard extends StatelessWidget {
  final MemberDetailEntity member;

  const MemberCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.kWhiteColor,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildText(
                  text: member.name,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  height: 24.sp / 18.sp,
                ),
                BuildText(
                  text: member.role,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  height: 24.sp / 12.sp,
                  color: AppColor.kTextDisabledColor,
                ),
                BuildText(
                  text: member.email,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 24.sp / 14.sp,
                  color: AppColor.kAccentColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(member.image),
            ),
          ),
        ],
      ),
    );
  }
}
