import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/logic/dashboard_tab/dashboard_tab_cubit.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/pages/dashboard_base_screen.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/widgets/custom_nav_bar.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/widgets/tab_box.dart';
import 'package:intuji_infogrid/feature/members/presentation/pages/member_base_screen.dart';
import 'package:intuji_infogrid/feature/more/presentation/pages/more_base_screen.dart';

class DashboardNavBar extends StatefulWidget {
  const DashboardNavBar({super.key});

  @override
  DashboardNavBarState createState() => DashboardNavBarState();
}

class DashboardNavBarState extends State<DashboardNavBar>
    with AutomaticKeepAliveClientMixin {
  final List<Widget> _screens = [
    const DashboardContainScreen(),
    const MemberBaseScreen(),
    const Align(alignment: Alignment.center, child: Text('Orders')),
    const MoreBaseScreen(),
  ];

  List<BottomNavigationBarItem> getBottomNavigationItems({
    required int selectedIndex,
  }) {
    return [
      BottomNavigationBarItem(
        icon: TabBox(
          label: 'Dashboard',
          icon: SvgPicture.asset(
            AppImages.dashboardIconSvg,
            colorFilter: ColorFilter.mode(
              selectedIndex == 0
                  ? AppColor.kAccentColor
                  : AppColor.kDisabledColorDark,
              BlendMode.srcIn,
            ),
          ),
          isActive: selectedIndex == 0,
        ),
        // label: 'ashboard',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: TabBox(
          label: 'Members',
          icon: SvgPicture.asset(
            AppImages.membersIconSvg,
            colorFilter: ColorFilter.mode(
              selectedIndex == 1
                  ? AppColor.kAccentColor
                  : AppColor.kDisabledColorDark,
              BlendMode.srcIn,
            ),
          ),
          isActive: selectedIndex == 1,
        ),
        // label: 'Categories',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: TabBox(
          label: 'Orders',
          icon: SvgPicture.asset(
            AppImages.ordersIconSvg,
            colorFilter: ColorFilter.mode(
              selectedIndex == 2
                  ? AppColor.kAccentColor
                  : AppColor.kDisabledColorDark,
              BlendMode.srcIn,
            ),
          ),

          isActive: selectedIndex == 2,
        ),
        // label: 'Offers',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: TabBox(
          label: 'More',
          icon: SvgPicture.asset(
            AppImages.moreIconSvg,
            colorFilter: ColorFilter.mode(
              selectedIndex == 3
                  ? AppColor.kAccentColor
                  : AppColor.kDisabledColorDark,
              BlendMode.srcIn,
            ),
          ),
          isActive: selectedIndex == 3,
        ),
        // label: 'Favorite',
        backgroundColor: Colors.white,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PopScope(
      canPop: false,
      child: BlocProvider(
        create: (context) => DashboardTabCubit(),
        child: BlocBuilder<DashboardTabCubit, DashboardTabState>(
          builder: (context, state) {
            final cubit = context.read<DashboardTabCubit>();
            return Scaffold(
              body: _screens[state.selectedIndex],
              bottomNavigationBar: Material(
                elevation: 8.0,
                child: CustomBottomNavigationBar(
                  items: getBottomNavigationItems(
                    selectedIndex: state.selectedIndex,
                  ),
                  currentIndex: state.selectedIndex,
                  onItemSelected: (index) {
                    cubit.onTabSelected(index);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
