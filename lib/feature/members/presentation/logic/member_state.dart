part of 'member_cubit.dart';

@freezed
class MemberState with _$MemberState {
  const MemberState._();

  const factory MemberState({
    @Default(null) List<MemberDetailEntity>? searchMembers,
    @Default(null) List<MemberDetailEntity>? members,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
  }) = _MemberState;

  @override
  List<MemberDetailEntity>? get members => throw UnimplementedError();

  @override
  List<MemberDetailEntity>? get searchMembers => throw UnimplementedError();

  @override
  bool get isError => throw UnimplementedError();

  @override
  bool get isLoading => throw UnimplementedError();
}
