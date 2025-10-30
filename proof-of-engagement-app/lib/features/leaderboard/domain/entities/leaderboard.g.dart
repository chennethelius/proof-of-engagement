// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardEntryImpl _$$LeaderboardEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaderboardEntryImpl(
      rank: (json['rank'] as num).toInt(),
      clubId: json['clubId'] as String,
      clubName: json['clubName'] as String,
      clubImage: json['clubImage'] as String,
      eloRating: (json['eloRating'] as num).toInt(),
      totalEvents: (json['totalEvents'] as num).toInt(),
      totalMembers: (json['totalMembers'] as num).toInt(),
      totalEngagement: (json['totalEngagement'] as num).toInt(),
      changePercentage: (json['changePercentage'] as num).toDouble(),
      rankChange: $enumDecode(_$RankChangeEnumMap, json['rankChange']),
    );

Map<String, dynamic> _$$LeaderboardEntryImplToJson(
        _$LeaderboardEntryImpl instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'clubId': instance.clubId,
      'clubName': instance.clubName,
      'clubImage': instance.clubImage,
      'eloRating': instance.eloRating,
      'totalEvents': instance.totalEvents,
      'totalMembers': instance.totalMembers,
      'totalEngagement': instance.totalEngagement,
      'changePercentage': instance.changePercentage,
      'rankChange': _$RankChangeEnumMap[instance.rankChange]!,
    };

const _$RankChangeEnumMap = {
  RankChange.up: 'up',
  RankChange.down: 'down',
  RankChange.same: 'same',
  RankChange.newEntry: 'new',
};

_$EloCalculationImpl _$$EloCalculationImplFromJson(Map<String, dynamic> json) =>
    _$EloCalculationImpl(
      clubId: json['clubId'] as String,
      currentElo: (json['currentElo'] as num).toInt(),
      newElo: (json['newElo'] as num).toInt(),
      eloDelta: (json['eloDelta'] as num).toInt(),
      reason: json['reason'] as String,
      calculatedAt: DateTime.parse(json['calculatedAt'] as String),
    );

Map<String, dynamic> _$$EloCalculationImplToJson(
        _$EloCalculationImpl instance) =>
    <String, dynamic>{
      'clubId': instance.clubId,
      'currentElo': instance.currentElo,
      'newElo': instance.newElo,
      'eloDelta': instance.eloDelta,
      'reason': instance.reason,
      'calculatedAt': instance.calculatedAt.toIso8601String(),
    };
