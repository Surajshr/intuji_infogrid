// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {

 EmailFormz get email; PasswordFormz get password; bool get isPasswordVisible; bool get isLoginLoading; String? get error;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isLoginLoading, isLoginLoading) || other.isLoginLoading == isLoginLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,isPasswordVisible,isLoginLoading,error);

@override
String toString() {
  return 'LoginState(email: $email, password: $password, isPasswordVisible: $isPasswordVisible, isLoginLoading: $isLoginLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 EmailFormz email, PasswordFormz password, bool isPasswordVisible, bool isLoginLoading, String? error
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? isPasswordVisible = null,Object? isLoginLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailFormz,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as PasswordFormz,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isLoginLoading: null == isLoginLoading ? _self.isLoginLoading : isLoginLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _LoginState extends LoginState {
  const _LoginState({this.email = const EmailFormz.pure(), this.password = const PasswordFormz.pure(), this.isPasswordVisible = false, this.isLoginLoading = false, this.error = ''}): super._();
  

@override@JsonKey() final  EmailFormz email;
@override@JsonKey() final  PasswordFormz password;
@override@JsonKey() final  bool isPasswordVisible;
@override@JsonKey() final  bool isLoginLoading;
@override@JsonKey() final  String? error;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isLoginLoading, isLoginLoading) || other.isLoginLoading == isLoginLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,isPasswordVisible,isLoginLoading,error);

@override
String toString() {
  return 'LoginState(email: $email, password: $password, isPasswordVisible: $isPasswordVisible, isLoginLoading: $isLoginLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 EmailFormz email, PasswordFormz password, bool isPasswordVisible, bool isLoginLoading, String? error
});




}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? isPasswordVisible = null,Object? isLoginLoading = null,Object? error = freezed,}) {
  return _then(_LoginState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailFormz,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as PasswordFormz,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isLoginLoading: null == isLoginLoading ? _self.isLoginLoading : isLoginLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
