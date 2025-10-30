// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      walletAddress: json['walletAddress'] as String,
      displayName: json['displayName'] as String,
      totalPoints: (json['totalPoints'] as num).toInt(),
      eventsAttended: (json['eventsAttended'] as num).toInt(),
      clubMemberships: (json['clubMemberships'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      eboardPositions: (json['eboardPositions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastActivity: json['lastActivity'] == null
          ? null
          : DateTime.parse(json['lastActivity'] as String),
      avatarUrl: json['avatarUrl'] as String?,
      email: json['email'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'walletAddress': instance.walletAddress,
      'displayName': instance.displayName,
      'totalPoints': instance.totalPoints,
      'eventsAttended': instance.eventsAttended,
      'clubMemberships': instance.clubMemberships,
      'eboardPositions': instance.eboardPositions,
      'lastActivity': instance.lastActivity?.toIso8601String(),
      'avatarUrl': instance.avatarUrl,
      'email': instance.email,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$UserEngagementImpl _$$UserEngagementImplFromJson(Map<String, dynamic> json) =>
    _$UserEngagementImpl(
      userId: json['userId'] as String,
      clubId: json['clubId'] as String,
      points: (json['points'] as num).toInt(),
      eventsAttended: (json['eventsAttended'] as num).toInt(),
      isEboard: json['isEboard'] as bool,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      lastAttendance: json['lastAttendance'] == null
          ? null
          : DateTime.parse(json['lastAttendance'] as String),
    );

Map<String, dynamic> _$$UserEngagementImplToJson(
        _$UserEngagementImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'clubId': instance.clubId,
      'points': instance.points,
      'eventsAttended': instance.eventsAttended,
      'isEboard': instance.isEboard,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'lastAttendance': instance.lastAttendance?.toIso8601String(),
    };

_$UserStatsImpl _$$UserStatsImplFromJson(Map<String, dynamic> json) =>
    _$UserStatsImpl(
      userId: json['userId'] as String,
      totalPoints: (json['totalPoints'] as num).toInt(),
      totalEvents: (json['totalEvents'] as num).toInt(),
      totalClubs: (json['totalClubs'] as num).toInt(),
      weeklyPoints: (json['weeklyPoints'] as num).toInt(),
      monthlyPoints: (json['monthlyPoints'] as num).toInt(),
      clubEngagements: (json['clubEngagements'] as List<dynamic>)
          .map((e) => ClubEngagement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserStatsImplToJson(_$UserStatsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'totalPoints': instance.totalPoints,
      'totalEvents': instance.totalEvents,
      'totalClubs': instance.totalClubs,
      'weeklyPoints': instance.weeklyPoints,
      'monthlyPoints': instance.monthlyPoints,
      'clubEngagements': instance.clubEngagements,
    };

_$ClubEngagementImpl _$$ClubEngagementImplFromJson(Map<String, dynamic> json) =>
    _$ClubEngagementImpl(
      clubId: json['clubId'] as String,
      clubName: json['clubName'] as String,
      points: (json['points'] as num).toInt(),
      eventsAttended: (json['eventsAttended'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
    );

Map<String, dynamic> _$$ClubEngagementImplToJson(
        _$ClubEngagementImpl instance) =>
    <String, dynamic>{
      'clubId': instance.clubId,
      'clubName': instance.clubName,
      'points': instance.points,
      'eventsAttended': instance.eventsAttended,
      'rank': instance.rank,
    };
