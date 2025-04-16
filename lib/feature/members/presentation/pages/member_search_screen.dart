import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/members/domain/entities/member_detail_entities.dart';
import 'package:intuji_infogrid/feature/members/presentation/logic/member_cubit.dart';
import 'package:intuji_infogrid/feature/members/presentation/widgets/member_card.dart';

class MemberSearchScreen extends StatefulWidget {
  const MemberSearchScreen({super.key});

  @override
  State<MemberSearchScreen> createState() => _MemberSearchScreenState();
}

class _MemberSearchScreenState extends State<MemberSearchScreen> {
  @override
  void initState() {
    context.read<MemberCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocBuilder<MemberCubit, MemberState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Search Members')),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                children: [
                  AppTextField(
                    labelText: 'Search Members',
                    onChanged: (value) {
                      context.read<MemberCubit>().onMemberSearch(value);
                    },
                  ),
                  if (state.isLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        itemCount: state.searchMembers?.length ?? 0,
                        itemBuilder:
                            (context, index) =>
                                state.searchMembers != null
                                    ? Padding(
                                      padding: EdgeInsets.only(bottom: 8.h),
                                      child: MemberCard(
                                        member: state.searchMembers![index],
                                      ),
                                    )
                                    : Center(
                                      child: BuildText(
                                        text: 'No members found',
                                      ),
                                    ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
