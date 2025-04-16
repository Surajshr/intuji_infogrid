import 'package:intuji_infogrid/core/constants/storage_constant.dart';
import 'package:intuji_infogrid/core/di/di.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/core/services/storage_service/storage_service.dart';
import 'package:intuji_infogrid/core/utils/jwt_util.dart';
import 'package:intuji_infogrid/feature/more/data/model/user_info_model.dart';
import 'package:intuji_infogrid/widgets/custom_app_bar.dart';

class MoreBaseScreen extends StatefulWidget {
  const MoreBaseScreen({super.key});

  @override
  State<MoreBaseScreen> createState() => _MoreBaseScreenState();
}

class _MoreBaseScreenState extends State<MoreBaseScreen> {
  final ValueNotifier<UserInfo?> userInfoNotifier = ValueNotifier<UserInfo?>(
    null,
  );

  Future<void> getUserDetail() async {
    final token = await di<StorageService>().readString(
      StorageConstants.kAccessToken,
    );
    final userInfo = JwtUtils.extractUserInfo(token ?? '');
    userInfoNotifier.value = userInfo;
  }

  @override
  void initState() {
    super.initState();
    getUserDetail();
  }

  @override
  void dispose() {
    userInfoNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'More',
            showBackButton: false,
            showSearchButton: false,
            showProfileButton: false,
          ),
          16.verticalSpace,
          ValueListenableBuilder<UserInfo?>(
            valueListenable: userInfoNotifier,
            builder: (context, userInfo, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 16.h,
                  ),
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: AppColor.kWhiteColor,
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 32.w,
                        backgroundImage: AssetImage(AppImages.profileIcon),
                      ),
                      16.verticalSpace,
                      BuildText(
                        text: userInfo?.name ?? 'John Doe',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      16.verticalSpace,
                      BuildText(
                        text: userInfo?.email ?? 'john.doe@example.com',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
