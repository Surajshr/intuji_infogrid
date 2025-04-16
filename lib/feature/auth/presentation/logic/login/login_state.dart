part of 'login_cubit.dart';

extension Validator on LoginState {
  bool get status => Formz.validate([email, password]);

  bool get canSubmit => (!email.isPure) && (!password.isPure) && status;
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(EmailFormz.pure()) EmailFormz email,
    @Default(PasswordFormz.pure()) PasswordFormz password,

    @Default(false) bool isPasswordVisible,
    @Default(false) bool isLoginLoading,
    @Default('') String? error,
  }) = _LoginState;
  const LoginState._();

  @override
  // TODO: implement email
  EmailFormz get email => throw UnimplementedError();

  @override
  // TODO: implement error
  String? get error => throw UnimplementedError();

  @override
  // TODO: implement isLoginLoading
  bool get isLoginLoading => throw UnimplementedError();

  @override
  // TODO: implement isPasswordVisible
  bool get isPasswordVisible => throw UnimplementedError();

  @override
  // TODO: implement password
  PasswordFormz get password => throw UnimplementedError();
}
