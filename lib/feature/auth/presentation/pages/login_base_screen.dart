import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intuji_infogrid/core/formz/formz_imports.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/auth/presentation/logic/login/login_cubit.dart';
import 'package:intuji_infogrid/route/app_route.dart';

class LoginBaseScreen extends StatefulWidget {
  const LoginBaseScreen({super.key});

  @override
  State<LoginBaseScreen> createState() => _LoginBaseScreenState();
}

class _LoginBaseScreenState extends State<LoginBaseScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: 'header_image',
                  child: SvgPicture.asset(
                    AppImages.headerContainerSvg,
                    width: 1.sw,
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: SvgPicture.asset(
                            AppImages.authBackgroundSvg,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    46.verticalSpace,
                                    BuildText(
                                      text: context.translate.signIn,
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.w800,
                                      height: 1.4,
                                    ),
                                    20.verticalSpace,
                                    AppTextField(
                                      fillColor: AppColor.kWhiteColor,
                                      labelText:
                                          context.translate.emailOrUsername,
                                      controller: emailController,
                                      onChanged: (value) {
                                        context
                                            .read<LoginCubit>()
                                            .onEmailChanged(value);
                                      },
                                      errorText:
                                          state.email.isNotValid &&
                                                  (!state.email.isPure)
                                              ? state.email.error?.explain
                                              : state.error != ''
                                              ? state
                                                  .error // Set to empty string to trigger error border
                                              : null,
                                    ),
                                    20.verticalSpace,
                                    AppTextField(
                                      fillColor: AppColor.kWhiteColor,
                                      labelText: context.translate.password,
                                      obscureText: !state.isPasswordVisible,
                                      controller: passwordController,
                                      onChanged: (value) {
                                        context
                                            .read<LoginCubit>()
                                            .onPasswordChanged(value);
                                      },
                                      errorText:
                                          state.password.isNotValid &&
                                                  (!state.password.isPure)
                                              ? state.password.error?.explain
                                              : state.error != ''
                                              ? state
                                                  .error // Set to empty string to trigger error border
                                              : null,
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          context
                                              .read<LoginCubit>()
                                              .togglePassword();
                                        },
                                        child: Text(
                                          state.isPasswordVisible
                                              ? 'HIDE'
                                              : 'SHOW',
                                          style: TextStyle(
                                            fontFamily:
                                                AppConstants.kFontFamily,
                                            color: AppColor.kTextDisabledColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    20.verticalSpace,
                                    AppButton(
                                      text: context.translate.signIn,
                                      isLoading: state.isLoginLoading,
                                      onPressed:
                                          state.canSubmit
                                              ? () {
                                                context
                                                    .read<LoginCubit>()
                                                    .onSignInPressed(context);
                                              }
                                              : null,
                                    ),
                                    20.verticalSpace,
                                    AppButton(
                                      text:
                                          context
                                              .translate
                                              .forgetPasswordQuestion,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.forgetPassword,
                                        );
                                      },
                                      buttonColor: AppColor.kWhiteColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 26.h,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: SvgPicture.asset(
                              AppImages.footerContentSvg,
                              height: 40.h,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
