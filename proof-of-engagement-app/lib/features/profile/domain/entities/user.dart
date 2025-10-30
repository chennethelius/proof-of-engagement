import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String walletAddress,
    required String displayName,
    required int totalPoints,
    required int eventsAttended,
    required List<String> clubMemberships,
    required List<String> eboardPositions,
    DateTime? lastActivity,
    String? avatarUrl,
    String? email,
    required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserEngagement with _$UserEngagement {
  const factory UserEngagement({
    required String userId,
    required String clubId,
    required int points,
    required int eventsAttended,
    required bool isEboard,
    required DateTime joinedAt,
    DateTime? lastAttendance,
  }) = _UserEngagement;

  factory UserEngagement.fromJson(Map<String, dynamic> json) => _$UserEngagementFromJson(json);
}

@freezed
class UserStats with _$UserStats {
  const factory UserStats({
    required String userId,
    required int totalPoints,
    required int totalEvents,
    required int totalClubs,
    required int weeklyPoints,
    required int monthlyPoints,
    required List<ClubEngagement> clubEngagements,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, dynamic> json) => _$UserStatsFromJson(json);
}

@freezed
class ClubEngagement with _$ClubEngagement {
  const factory ClubEngagement({
    required String clubId,
    required String clubName,
    required int points,
    required int eventsAttended,
    required int rank,
  }) = _ClubEngagement;

  factory ClubEngagement.fromJson(Map<String, dynamic> json) => _$ClubEngagementFromJson(json);
}
