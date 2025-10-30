// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaderboardEntry _$LeaderboardEntryFromJson(Map<String, dynamic> json) {
  return _LeaderboardEntry.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardEntry {
  int get rank => throw _privateConstructorUsedError;
  String get clubId => throw _privateConstructorUsedError;
  String get clubName => throw _privateConstructorUsedError;
  String get clubImage => throw _privateConstructorUsedError;
  int get eloRating => throw _privateConstructorUsedError;
  int get totalEvents => throw _privateConstructorUsedError;
  int get totalMembers => throw _privateConstructorUsedError;
  int get totalEngagement => throw _privateConstructorUsedError;
  double get changePercentage => throw _privateConstructorUsedError;
  RankChange get rankChange => throw _privateConstructorUsedError;

  /// Serializes this LeaderboardEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardEntryCopyWith<LeaderboardEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardEntryCopyWith<$Res> {
  factory $LeaderboardEntryCopyWith(
          LeaderboardEntry value, $Res Function(LeaderboardEntry) then) =
      _$LeaderboardEntryCopyWithImpl<$Res, LeaderboardEntry>;
  @useResult
  $Res call(
      {int rank,
      String clubId,
      String clubName,
      String clubImage,
      int eloRating,
      int totalEvents,
      int totalMembers,
      int totalEngagement,
      double changePercentage,
      RankChange rankChange});
}

/// @nodoc
class _$LeaderboardEntryCopyWithImpl<$Res, $Val extends LeaderboardEntry>
    implements $LeaderboardEntryCopyWith<$Res> {
  _$LeaderboardEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? clubId = null,
    Object? clubName = null,
    Object? clubImage = null,
    Object? eloRating = null,
    Object? totalEvents = null,
    Object? totalMembers = null,
    Object? totalEngagement = null,
    Object? changePercentage = null,
    Object? rankChange = null,
  }) {
    return _then(_value.copyWith(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      clubImage: null == clubImage
          ? _value.clubImage
          : clubImage // ignore: cast_nullable_to_non_nullable
              as String,
      eloRating: null == eloRating
          ? _value.eloRating
          : eloRating // ignore: cast_nullable_to_non_nullable
              as int,
      totalEvents: null == totalEvents
          ? _value.totalEvents
          : totalEvents // ignore: cast_nullable_to_non_nullable
              as int,
      totalMembers: null == totalMembers
          ? _value.totalMembers
          : totalMembers // ignore: cast_nullable_to_non_nullable
              as int,
      totalEngagement: null == totalEngagement
          ? _value.totalEngagement
          : totalEngagement // ignore: cast_nullable_to_non_nullable
              as int,
      changePercentage: null == changePercentage
          ? _value.changePercentage
          : changePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      rankChange: null == rankChange
          ? _value.rankChange
          : rankChange // ignore: cast_nullable_to_non_nullable
              as RankChange,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderboardEntryImplCopyWith<$Res>
    implements $LeaderboardEntryCopyWith<$Res> {
  factory _$$LeaderboardEntryImplCopyWith(_$LeaderboardEntryImpl value,
          $Res Function(_$LeaderboardEntryImpl) then) =
      __$$LeaderboardEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int rank,
      String clubId,
      String clubName,
      String clubImage,
      int eloRating,
      int totalEvents,
      int totalMembers,
      int totalEngagement,
      double changePercentage,
      RankChange rankChange});
}

/// @nodoc
class __$$LeaderboardEntryImplCopyWithImpl<$Res>
    extends _$LeaderboardEntryCopyWithImpl<$Res, _$LeaderboardEntryImpl>
    implements _$$LeaderboardEntryImplCopyWith<$Res> {
  __$$LeaderboardEntryImplCopyWithImpl(_$LeaderboardEntryImpl _value,
      $Res Function(_$LeaderboardEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? clubId = null,
    Object? clubName = null,
    Object? clubImage = null,
    Object? eloRating = null,
    Object? totalEvents = null,
    Object? totalMembers = null,
    Object? totalEngagement = null,
    Object? changePercentage = null,
    Object? rankChange = null,
  }) {
    return _then(_$LeaderboardEntryImpl(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      clubImage: null == clubImage
          ? _value.clubImage
          : clubImage // ignore: cast_nullable_to_non_nullable
              as String,
      eloRating: null == eloRating
          ? _value.eloRating
          : eloRating // ignore: cast_nullable_to_non_nullable
              as int,
      totalEvents: null == totalEvents
          ? _value.totalEvents
          : totalEvents // ignore: cast_nullable_to_non_nullable
              as int,
      totalMembers: null == totalMembers
          ? _value.totalMembers
          : totalMembers // ignore: cast_nullable_to_non_nullable
              as int,
      totalEngagement: null == totalEngagement
          ? _value.totalEngagement
          : totalEngagement // ignore: cast_nullable_to_non_nullable
              as int,
      changePercentage: null == changePercentage
          ? _value.changePercentage
          : changePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      rankChange: null == rankChange
          ? _value.rankChange
          : rankChange // ignore: cast_nullable_to_non_nullable
              as RankChange,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaderboardEntryImpl implements _LeaderboardEntry {
  const _$LeaderboardEntryImpl(
      {required this.rank,
      required this.clubId,
      required this.clubName,
      required this.clubImage,
      required this.eloRating,
      required this.totalEvents,
      required this.totalMembers,
      required this.totalEngagement,
      required this.changePercentage,
      required this.rankChange});

  factory _$LeaderboardEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardEntryImplFromJson(json);

  @override
  final int rank;
  @override
  final String clubId;
  @override
  final String clubName;
  @override
  final String clubImage;
  @override
  final int eloRating;
  @override
  final int totalEvents;
  @override
  final int totalMembers;
  @override
  final int totalEngagement;
  @override
  final double changePercentage;
  @override
  final RankChange rankChange;

  @override
  String toString() {
    return 'LeaderboardEntry(rank: $rank, clubId: $clubId, clubName: $clubName, clubImage: $clubImage, eloRating: $eloRating, totalEvents: $totalEvents, totalMembers: $totalMembers, totalEngagement: $totalEngagement, changePercentage: $changePercentage, rankChange: $rankChange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardEntryImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.clubId, clubId) || other.clubId == clubId) &&
            (identical(other.clubName, clubName) ||
                other.clubName == clubName) &&
            (identical(other.clubImage, clubImage) ||
                other.clubImage == clubImage) &&
            (identical(other.eloRating, eloRating) ||
                other.eloRating == eloRating) &&
            (identical(other.totalEvents, totalEvents) ||
                other.totalEvents == totalEvents) &&
            (identical(other.totalMembers, totalMembers) ||
                other.totalMembers == totalMembers) &&
            (identical(other.totalEngagement, totalEngagement) ||
                other.totalEngagement == totalEngagement) &&
            (identical(other.changePercentage, changePercentage) ||
                other.changePercentage == changePercentage) &&
            (identical(other.rankChange, rankChange) ||
                other.rankChange == rankChange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      rank,
      clubId,
      clubName,
      clubImage,
      eloRating,
      totalEvents,
      totalMembers,
      totalEngagement,
      changePercentage,
      rankChange);

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardEntryImplCopyWith<_$LeaderboardEntryImpl> get copyWith =>
      __$$LeaderboardEntryImplCopyWithImpl<_$LeaderboardEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardEntryImplToJson(
      this,
    );
  }
}

abstract class _LeaderboardEntry implements LeaderboardEntry {
  const factory _LeaderboardEntry(
      {required final int rank,
      required final String clubId,
      required final String clubName,
      required final String clubImage,
      required final int eloRating,
      required final int totalEvents,
      required final int totalMembers,
      required final int totalEngagement,
      required final double changePercentage,
      required final RankChange rankChange}) = _$LeaderboardEntryImpl;

  factory _LeaderboardEntry.fromJson(Map<String, dynamic> json) =
      _$LeaderboardEntryImpl.fromJson;

  @override
  int get rank;
  @override
  String get clubId;
  @override
  String get clubName;
  @override
  String get clubImage;
  @override
  int get eloRating;
  @override
  int get totalEvents;
  @override
  int get totalMembers;
  @override
  int get totalEngagement;
  @override
  double get changePercentage;
  @override
  RankChange get rankChange;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardEntryImplCopyWith<_$LeaderboardEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EloCalculation _$EloCalculationFromJson(Map<String, dynamic> json) {
  return _EloCalculation.fromJson(json);
}

/// @nodoc
mixin _$EloCalculation {
  String get clubId => throw _privateConstructorUsedError;
  int get currentElo => throw _privateConstructorUsedError;
  int get newElo => throw _privateConstructorUsedError;
  int get eloDelta => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// Serializes this EloCalculation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EloCalculation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EloCalculationCopyWith<EloCalculation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EloCalculationCopyWith<$Res> {
  factory $EloCalculationCopyWith(
          EloCalculation value, $Res Function(EloCalculation) then) =
      _$EloCalculationCopyWithImpl<$Res, EloCalculation>;
  @useResult
  $Res call(
      {String clubId,
      int currentElo,
      int newElo,
      int eloDelta,
      String reason,
      DateTime calculatedAt});
}

/// @nodoc
class _$EloCalculationCopyWithImpl<$Res, $Val extends EloCalculation>
    implements $EloCalculationCopyWith<$Res> {
  _$EloCalculationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EloCalculation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubId = null,
    Object? currentElo = null,
    Object? newElo = null,
    Object? eloDelta = null,
    Object? reason = null,
    Object? calculatedAt = null,
  }) {
    return _then(_value.copyWith(
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      currentElo: null == currentElo
          ? _value.currentElo
          : currentElo // ignore: cast_nullable_to_non_nullable
              as int,
      newElo: null == newElo
          ? _value.newElo
          : newElo // ignore: cast_nullable_to_non_nullable
              as int,
      eloDelta: null == eloDelta
          ? _value.eloDelta
          : eloDelta // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      calculatedAt: null == calculatedAt
          ? _value.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EloCalculationImplCopyWith<$Res>
    implements $EloCalculationCopyWith<$Res> {
  factory _$$EloCalculationImplCopyWith(_$EloCalculationImpl value,
          $Res Function(_$EloCalculationImpl) then) =
      __$$EloCalculationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clubId,
      int currentElo,
      int newElo,
      int eloDelta,
      String reason,
      DateTime calculatedAt});
}

/// @nodoc
class __$$EloCalculationImplCopyWithImpl<$Res>
    extends _$EloCalculationCopyWithImpl<$Res, _$EloCalculationImpl>
    implements _$$EloCalculationImplCopyWith<$Res> {
  __$$EloCalculationImplCopyWithImpl(
      _$EloCalculationImpl _value, $Res Function(_$EloCalculationImpl) _then)
      : super(_value, _then);

  /// Create a copy of EloCalculation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubId = null,
    Object? currentElo = null,
    Object? newElo = null,
    Object? eloDelta = null,
    Object? reason = null,
    Object? calculatedAt = null,
  }) {
    return _then(_$EloCalculationImpl(
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      currentElo: null == currentElo
          ? _value.currentElo
          : currentElo // ignore: cast_nullable_to_non_nullable
              as int,
      newElo: null == newElo
          ? _value.newElo
          : newElo // ignore: cast_nullable_to_non_nullable
              as int,
      eloDelta: null == eloDelta
          ? _value.eloDelta
          : eloDelta // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      calculatedAt: null == calculatedAt
          ? _value.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EloCalculationImpl implements _EloCalculation {
  const _$EloCalculationImpl(
      {required this.clubId,
      required this.currentElo,
      required this.newElo,
      required this.eloDelta,
      required this.reason,
      required this.calculatedAt});

  factory _$EloCalculationImpl.fromJson(Map<String, dynamic> json) =>
      _$$EloCalculationImplFromJson(json);

  @override
  final String clubId;
  @override
  final int currentElo;
  @override
  final int newElo;
  @override
  final int eloDelta;
  @override
  final String reason;
  @override
  final DateTime calculatedAt;

  @override
  String toString() {
    return 'EloCalculation(clubId: $clubId, currentElo: $currentElo, newElo: $newElo, eloDelta: $eloDelta, reason: $reason, calculatedAt: $calculatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EloCalculationImpl &&
            (identical(other.clubId, clubId) || other.clubId == clubId) &&
            (identical(other.currentElo, currentElo) ||
                other.currentElo == currentElo) &&
            (identical(other.newElo, newElo) || other.newElo == newElo) &&
            (identical(other.eloDelta, eloDelta) ||
                other.eloDelta == eloDelta) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, clubId, currentElo, newElo, eloDelta, reason, calculatedAt);

  /// Create a copy of EloCalculation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EloCalculationImplCopyWith<_$EloCalculationImpl> get copyWith =>
      __$$EloCalculationImplCopyWithImpl<_$EloCalculationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EloCalculationImplToJson(
      this,
    );
  }
}

abstract class _EloCalculation implements EloCalculation {
  const factory _EloCalculation(
      {required final String clubId,
      required final int currentElo,
      required final int newElo,
      required final int eloDelta,
      required final String reason,
      required final DateTime calculatedAt}) = _$EloCalculationImpl;

  factory _EloCalculation.fromJson(Map<String, dynamic> json) =
      _$EloCalculationImpl.fromJson;

  @override
  String get clubId;
  @override
  int get currentElo;
  @override
  int get newElo;
  @override
  int get eloDelta;
  @override
  String get reason;
  @override
  DateTime get calculatedAt;

  /// Create a copy of EloCalculation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EloCalculationImplCopyWith<_$EloCalculationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
