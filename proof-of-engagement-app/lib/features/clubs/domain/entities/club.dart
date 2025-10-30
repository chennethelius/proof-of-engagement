import 'package:freezed_annotation/freezed_annotation.dart';

part 'club.freezed.dart';
part 'club.g.dart';

@freezed
class Club with _$Club {
  const factory Club({
    required String id,
    required String name,
    required String description,
    required String walletAddress,
    required String imageUrl,
    required List<String> categories,
    required int eloRating,
    required int rank,
    required int totalEvents,
    required int totalMembers,
    required int totalEngagement,
    required List<String> eboard,
    required DateTime createdAt,
    DateTime? lastEventDate,
  }) = _Club;

  factory Club.fromJson(Map<String, dynamic> json) => _$ClubFromJson(json);
}

@freezed
class ClubStats with _$ClubStats {
  const factory ClubStats({
    required String clubId,
    required int weeklyEngagement,
    required int monthlyEngagement,
    required int totalEngagement,
    required double averageAttendance,
    required List<TopMember> topMembers,
  }) = _ClubStats;

  factory ClubStats.fromJson(Map<String, dynamic> json) => _$ClubStatsFromJson(json);
}

@freezed
class TopMember with _$TopMember {
  const factory TopMember({
    required String userId,
    required String walletAddress,
    required String displayName,
    required int points,
    required int eventsAttended,
    String? avatarUrl,
  }) = _TopMember;

  factory TopMember.fromJson(Map<String, dynamic> json) => _$TopMemberFromJson(json);
}
