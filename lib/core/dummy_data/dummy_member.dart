import 'package:intuji_infogrid/core/constants/image_constants.dart';
import 'package:intuji_infogrid/feature/members/domain/entities/member_detail_entities.dart';

List<MemberDetailEntity> getDummyMembers() {
  return [
    MemberDetailEntity(
      id: 1,
      name: 'John Smith',
      image: AppImages.member1Png,
      role: 'Senior Developer',
      email: 'john.smith@example.com',
    ),
    MemberDetailEntity(
      id: 2,
      name: 'Sarah Johnson',
      image: AppImages.member2Png,
      role: 'Project Manager',
      email: 'sarah.j@example.com',
    ),
    MemberDetailEntity(
      id: 3,
      name: 'Michael Chen',
      image: AppImages.member3Png,
      role: 'UI/UX Designer',
      email: 'michael.c@example.com',
    ),
    MemberDetailEntity(
      id: 4,
      name: 'Emma Wilson',
      image: AppImages.member4Png,
      role: 'Product Owner',
      email: 'emma.w@example.com',
    ),
    MemberDetailEntity(
      id: 5,
      name: 'David Brown',
      image: AppImages.member5Png,
      role: 'QA Engineer',
      email: 'david.b@example.com',
    ),
    MemberDetailEntity(
      id: 6,
      name: 'Lisa Anderson',
      image: AppImages.member6Png,
      role: 'Backend Developer',
      email: 'lisa.a@example.com',
    ),
    MemberDetailEntity(
      id: 7,
      name: 'James Wilson',
      image: AppImages.member7Png,
      role: 'DevOps Engineer',
      email: 'james.w@example.com',
    ),
  ];
}
