import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intuji_infogrid/core/di/di.dart';
import 'package:intuji_infogrid/core/formz/formz_imports.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/auth/domain/usecases/auth_usecase.dart';
import 'package:intuji_infogrid/widgets/custom_dialogbox.dart';
part 'forget_password_cubit.freezed.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(const ForgetPasswordState());
  final _authUsecase = di<AuthUsecase>();

  void onForgetPasswordEmailChanged(String value) {
    final email = EmailFormz.dirty(value.trim());

    emit(
      state.copyWith(
        email: value.trim().isEmpty ? const EmailFormz.pure() : email,

        error: '',
      ),
    );
  }

  void onForgetPasswordPressed(BuildContext context) {
    showCustomDialogBox(
      context,
      imageUrl: AppImages.mailSentSvg,
      text:
          'A password reset link is sent to the provided email address. If the email is valid, you will receive the link. After resetting your password, try logging in again',
      onPressed: () => context.popTimes(2),
    );
    // final email = state.email.value;
    // if (email.isEmpty) {
    //   emit(state.copyWith(error: 'Email is required'));
    // }
    // else{
    //   emit(state.copyWith(isForgetPasswordLoading: true));
    //   final result = await _authUsecase.forgetPassword(email);
    //   emit(state.copyWith(isForgetPasswordLoading: false));
    // }
  }
}
