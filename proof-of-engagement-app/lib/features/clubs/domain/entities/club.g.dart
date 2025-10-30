// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClubImpl _$$ClubImplFromJson(Map<String, dynamic> json) => _$ClubImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      walletAddress: json['walletAddress'] as String,
      imageUrl: json['imageUrl'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      eloRating: (json['eloRating'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
      totalEvents: (json['totalEvents'] as num).toInt(),
      totalMembers: (json['totalMembers'] as num).toInt(),
      totalEngagement: (json['totalEngagement'] as num).toInt(),
      eboard:
          (json['eboard'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastEventDate: json['lastEventDate'] == null
          ? null
          : DateTime.parse(json['lastEventDate'] as String),
    );

Map<String, dynamic> _$$ClubImplToJson(_$ClubImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'walletAddress': instance.walletAddress,
      'imageUrl': instance.imageUrl,
      'categories': instance.categories,
      'eloRating': instance.eloRating,
      'rank': instance.rank,
      'totalEvents': instance.totalEvents,
      'totalMembers': instance.totalMembers,
      'totalEngagement': instance.totalEngagement,
      'eboard': instance.eboard,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastEventDate': instance.lastEventDate?.toIso8601String(),
    };

_$ClubStatsImpl _$$ClubStatsImplFromJson(Map<String, dynamic> json) =>
    _$ClubStatsImpl(
      clubId: json['clubId'] as String,
      weeklyEngagement: (json['weeklyEngagement'] as num).toInt(),
      monthlyEngagement: (json['monthlyEngagement'] as num).toInt(),
      totalEngagement: (json['totalEngagement'] as num).toInt(),
      averageAttendance: (json['averageAttendance'] as num).toDouble(),
      topMembers: (json['topMembers'] as List<dynamic>)
          .map((e) => TopMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClubStatsImplToJson(_$ClubStatsImpl instance) =>
    <String, dynamic>{
      'clubId': instance.clubId,
      'weeklyEngagement': instance.weeklyEngagement,
      'monthlyEngagement': instance.monthlyEngagement,
      'totalEngagement': instance.totalEngagement,
      'averageAttendance': instance.averageAttendance,
      'topMembers': instance.topMembers,
    };

_$TopMemberImpl _$$TopMemberImplFromJson(Map<String, dynamic> json) =>
    _$TopMemberImpl(
      userId: json['userId'] as String,
      walletAddress: json['walletAddress'] as String,
      displayName: json['displayName'] as String,
      points: (json['points'] as num).toInt(),
      eventsAttended: (json['eventsAttended'] as num).toInt(),
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$$TopMemberImplToJson(_$TopMemberImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'walletAddress': instance.walletAddress,
      'displayName': instance.displayName,
      'points': instance.points,
      'eventsAttended': instance.eventsAttended,
      'avatarUrl': instance.avatarUrl,
    };
