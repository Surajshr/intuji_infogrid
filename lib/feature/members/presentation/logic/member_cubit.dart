import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intuji_infogrid/core/dummy_data/dummy_member.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/members/domain/entities/member_detail_entities.dart';

part 'member_state.dart';

part 'member_cubit.freezed.dart';

class MemberCubit extends Cubit<MemberState> {
  MemberCubit() : super(const MemberState());

  void init() {
    emit(state.copyWith(members: getDummyMembers()));
  }

  void onMemberSearch(String search) {
    try {
      if (search.isEmpty) {
        emit(state.copyWith(searchMembers: getDummyMembers()));
      } else {
        emit(
          state.copyWith(
            searchMembers:
                state.members
                    ?.where(
                      (member) => member.name.toLowerCase().contains(
                        search.toLowerCase(),
                      ),
                    )
                    .toList(),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, isError: true));
    }
  }

  void onSearchClear() {
    emit(state.copyWith(searchMembers: getDummyMembers()));
  }
}
