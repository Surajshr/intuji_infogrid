import 'package:intuji_infogrid/core/formz/formz_imports.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/auth/presentation/logic/forget_password/forget_password_cubit.dart';
import 'package:intuji_infogrid/feature/auth/presentation/logic/login/login_cubit.dart';
import 'package:intuji_infogrid/route/app_route.dart';

class ForgetPasswordBaseScreen extends StatefulWidget {
  const ForgetPasswordBaseScreen({super.key});

  @override
  State<ForgetPasswordBaseScreen> createState() =>
      _ForgetPasswordBaseScreenState();
}

class _ForgetPasswordBaseScreenState extends State<ForgetPasswordBaseScreen> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocProvider(
        create: (context) => ForgetPasswordCubit(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
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
                child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
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
                                      text: context.translate.forgetPassword,
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
                                            .read<ForgetPasswordCubit>()
                                            .onForgetPasswordEmailChanged(
                                              value,
                                            );
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

                                    AppButton(
                                      text: context.translate.continueText,
                                      isLoading: state.isForgetPasswordLoading,
                                      onPressed:
                                          state.canSubmit
                                              ? () {
                                                context
                                                    .read<ForgetPasswordCubit>()
                                                    .onForgetPasswordPressed(
                                                      context,
                                                    );
                                              }
                                              : null,
                                    ),
                                  ],
                                ),
                              ],
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
