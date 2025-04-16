import 'package:flutter/material.dart';
import 'package:intuji_infogrid/core/dummy_data/dummy_member.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/members/domain/entities/member_detail_entities.dart';
import 'package:intuji_infogrid/feature/members/presentation/widgets/member_card.dart';
import 'package:intuji_infogrid/route/app_route.dart';
import 'package:intuji_infogrid/widgets/custom_app_bar.dart';

class MemberBaseScreen extends StatefulWidget {
  const MemberBaseScreen({super.key});

  @override
  State<MemberBaseScreen> createState() => _MemberBaseScreenState();
}

class _MemberBaseScreenState extends State<MemberBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Members',
            showBackButton: false,
            showProfileButton: false,
            showSearchButton: true,
            onSearchButtonPressed: () {
              Navigator.pushNamed(context, AppRoutes.memberSearch);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getDummyMembers().length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),

              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: MemberCard(member: getDummyMembers()[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
