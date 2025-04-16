import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intuji_infogrid/core/constants/storage_constant.dart';
import 'package:intuji_infogrid/core/di/di.dart';
import 'package:intuji_infogrid/core/formz/formz_imports.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/core/services/storage_service/storage_service.dart';
import 'package:intuji_infogrid/feature/auth/domain/usecases/auth_usecase.dart';
import 'package:intuji_infogrid/route/app_route.dart';
part 'login_cubit.freezed.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  final _authUsecase = di<AuthUsecase>();

  void onEmailChanged(String value) {
    final email = EmailFormz.dirty(value.trim());

    emit(
      state.copyWith(
        email: value.trim().isEmpty ? const EmailFormz.pure() : email,
        password: state.password,
        error: '',
      ),
    );
  }

  void onPasswordChanged(String value) {
    final password = PasswordFormz.dirty(value.trim());

    emit(
      state.copyWith(
        password: value.trim().isEmpty ? const PasswordFormz.pure() : password,
        error: '',
      ),
    );
  }

  void togglePassword() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> onSignInPressed(BuildContext context) async {
    emit(state.copyWith(isLoginLoading: true));
    final result = await _authUsecase.login(
      state.email.value,
      state.password.value,
    );

    result.fold(
      (error) {
        emit(state.copyWith(isLoginLoading: false));
        emit(state.copyWith(error: error));
      },
      (user) {
        di<StorageService>().writeString(
          StorageConstants.kAccessToken,
          user ?? '',
        );
        emit(state.copyWith(isLoginLoading: false));
        Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
      },
    );
  }
}
