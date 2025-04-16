// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgetPasswordState {

 EmailFormz get email; bool get isForgetPasswordLoading; String? get error;
/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgetPasswordStateCopyWith<ForgetPasswordState> get copyWith => _$ForgetPasswordStateCopyWithImpl<ForgetPasswordState>(this as ForgetPasswordState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordState&&(identical(other.email, email) || other.email == email)&&(identical(other.isForgetPasswordLoading, isForgetPasswordLoading) || other.isForgetPasswordLoading == isForgetPasswordLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,isForgetPasswordLoading,error);

@override
String toString() {
  return 'ForgetPasswordState(email: $email, isForgetPasswordLoading: $isForgetPasswordLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ForgetPasswordStateCopyWith<$Res>  {
  factory $ForgetPasswordStateCopyWith(ForgetPasswordState value, $Res Function(ForgetPasswordState) _then) = _$ForgetPasswordStateCopyWithImpl;
@useResult
$Res call({
 EmailFormz email, bool isForgetPasswordLoading, String? error
});




}
/// @nodoc
class _$ForgetPasswordStateCopyWithImpl<$Res>
    implements $ForgetPasswordStateCopyWith<$Res> {
  _$ForgetPasswordStateCopyWithImpl(this._self, this._then);

  final ForgetPasswordState _self;
  final $Res Function(ForgetPasswordState) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? isForgetPasswordLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailFormz,isForgetPasswordLoading: null == isForgetPasswordLoading ? _self.isForgetPasswordLoading : isForgetPasswordLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _ForgetPasswordState extends ForgetPasswordState {
  const _ForgetPasswordState({this.email = const EmailFormz.pure(), this.isForgetPasswordLoading = false, this.error = ''}): super._();
  

@override@JsonKey() final  EmailFormz email;
@override@JsonKey() final  bool isForgetPasswordLoading;
@override@JsonKey() final  String? error;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgetPasswordStateCopyWith<_ForgetPasswordState> get copyWith => __$ForgetPasswordStateCopyWithImpl<_ForgetPasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgetPasswordState&&(identical(other.email, email) || other.email == email)&&(identical(other.isForgetPasswordLoading, isForgetPasswordLoading) || other.isForgetPasswordLoading == isForgetPasswordLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,isForgetPasswordLoading,error);

@override
String toString() {
  return 'ForgetPasswordState(email: $email, isForgetPasswordLoading: $isForgetPasswordLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ForgetPasswordStateCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory _$ForgetPasswordStateCopyWith(_ForgetPasswordState value, $Res Function(_ForgetPasswordState) _then) = __$ForgetPasswordStateCopyWithImpl;
@override @useResult
$Res call({
 EmailFormz email, bool isForgetPasswordLoading, String? error
});




}
/// @nodoc
class __$ForgetPasswordStateCopyWithImpl<$Res>
    implements _$ForgetPasswordStateCopyWith<$Res> {
  __$ForgetPasswordStateCopyWithImpl(this._self, this._then);

  final _ForgetPasswordState _self;
  final $Res Function(_ForgetPasswordState) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? isForgetPasswordLoading = null,Object? error = freezed,}) {
  return _then(_ForgetPasswordState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailFormz,isForgetPasswordLoading: null == isForgetPasswordLoading ? _self.isForgetPasswordLoading : isForgetPasswordLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
