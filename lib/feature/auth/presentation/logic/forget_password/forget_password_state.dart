part of 'forget_password_cubit.dart';

extension Validator on ForgetPasswordState {
  bool get status => Formz.validate([email]);

  bool get canSubmit => (!email.isPure) && status;
}

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState({
    @Default(EmailFormz.pure()) EmailFormz email,

    @Default(false) bool isForgetPasswordLoading,
    @Default('') String? error,
  }) = _ForgetPasswordState;
  const ForgetPasswordState._();

  @override
  // TODO: implement email
  EmailFormz get email => throw UnimplementedError();

  @override
  // TODO: implement error
  String? get error => throw UnimplementedError();

  @override
  // TODO: implement isForgetPasswordLoading
  bool get isForgetPasswordLoading => throw UnimplementedError();
}
