import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/splash/presentation/logic/splash_cubit.dart';
import 'package:intuji_infogrid/route/app_route.dart';

class SplashBaseScreen extends StatefulWidget {
  const SplashBaseScreen({super.key});

  @override
  State<SplashBaseScreen> createState() => _SplashBaseScreenState();
}

class _SplashBaseScreenState extends State<SplashBaseScreen> {
  @override
  void initState() {
    super.initState();

    /* 
    instead of using delay we will call api to check if user is logged in or not and navigate accordingly.
    */
    Future.delayed(const Duration(seconds: 2), () {
      context.read<SplashCubit>().checkUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, bool>(
      listener: (context, state) {
        if (state) {
          Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Image.asset(AppImages.logo)],
          ),
        ),
      ),
    );
  }
}
