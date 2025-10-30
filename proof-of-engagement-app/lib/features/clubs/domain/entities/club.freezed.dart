// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Club _$ClubFromJson(Map<String, dynamic> json) {
  return _Club.fromJson(json);
}

/// @nodoc
mixin _$Club {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  int get eloRating => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  int get totalEvents => throw _privateConstructorUsedError;
  int get totalMembers => throw _privateConstructorUsedError;
  int get totalEngagement => throw _privateConstructorUsedError;
  List<String> get eboard => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastEventDate => throw _privateConstructorUsedError;

  /// Serializes this Club to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClubCopyWith<Club> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubCopyWith<$Res> {
  factory $ClubCopyWith(Club value, $Res Function(Club) then) =
      _$ClubCopyWithImpl<$Res, Club>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String walletAddress,
      String imageUrl,
      List<String> categories,
      int eloRating,
      int rank,
      int totalEvents,
      int totalMembers,
      int totalEngagement,
      List<String> eboard,
      DateTime createdAt,
      DateTime? lastEventDate});
}

/// @nodoc
class _$ClubCopyWithImpl<$Res, $Val extends Club>
    implements $ClubCopyWith<$Res> {
  _$ClubCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? walletAddress = null,
    Object? imageUrl = null,
    Object? categories = null,
    Object? eloRating = null,
    Object? rank = null,
    Object? totalEvents = null,
    Object? totalMembers = null,
    Object? totalEngagement = null,
    Object? eboard = null,
    Object? createdAt = null,
    Object? lastEventDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eloRating: null == eloRating
          ? _value.eloRating
          : eloRating // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
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
      eboard: null == eboard
          ? _value.eboard
          : eboard // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastEventDate: freezed == lastEventDate
          ? _value.lastEventDate
          : lastEventDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubImplCopyWith<$Res> implements $ClubCopyWith<$Res> {
  factory _$$ClubImplCopyWith(
          _$ClubImpl value, $Res Function(_$ClubImpl) then) =
      __$$ClubImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String walletAddress,
      String imageUrl,
      List<String> categories,
      int eloRating,
      int rank,
      int totalEvents,
      int totalMembers,
      int totalEngagement,
      List<String> eboard,
      DateTime createdAt,
      DateTime? lastEventDate});
}

/// @nodoc
class __$$ClubImplCopyWithImpl<$Res>
    extends _$ClubCopyWithImpl<$Res, _$ClubImpl>
    implements _$$ClubImplCopyWith<$Res> {
  __$$ClubImplCopyWithImpl(_$ClubImpl _value, $Res Function(_$ClubImpl) _then)
      : super(_value, _then);

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? walletAddress = null,
    Object? imageUrl = null,
    Object? categories = null,
    Object? eloRating = null,
    Object? rank = null,
    Object? totalEvents = null,
    Object? totalMembers = null,
    Object? totalEngagement = null,
    Object? eboard = null,
    Object? createdAt = null,
    Object? lastEventDate = freezed,
  }) {
    return _then(_$ClubImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eloRating: null == eloRating
          ? _value.eloRating
          : eloRating // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
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
      eboard: null == eboard
          ? _value._eboard
          : eboard // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastEventDate: freezed == lastEventDate
          ? _value.lastEventDate
          : lastEventDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubImpl implements _Club {
  const _$ClubImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.walletAddress,
      required this.imageUrl,
      required final List<String> categories,
      required this.eloRating,
      required this.rank,
      required this.totalEvents,
      required this.totalMembers,
      required this.totalEngagement,
      required final List<String> eboard,
      required this.createdAt,
      this.lastEventDate})
      : _categories = categories,
        _eboard = eboard;

  factory _$ClubImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String walletAddress;
  @override
  final String imageUrl;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final int eloRating;
  @override
  final int rank;
  @override
  final int totalEvents;
  @override
  final int totalMembers;
  @override
  final int totalEngagement;
  final List<String> _eboard;
  @override
  List<String> get eboard {
    if (_eboard is EqualUnmodifiableListView) return _eboard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eboard);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime? lastEventDate;

  @override
  String toString() {
    return 'Club(id: $id, name: $name, description: $description, walletAddress: $walletAddress, imageUrl: $imageUrl, categories: $categories, eloRating: $eloRating, rank: $rank, totalEvents: $totalEvents, totalMembers: $totalMembers, totalEngagement: $totalEngagement, eboard: $eboard, createdAt: $createdAt, lastEventDate: $lastEventDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.eloRating, eloRating) ||
                other.eloRating == eloRating) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.totalEvents, totalEvents) ||
                other.totalEvents == totalEvents) &&
            (identical(other.totalMembers, totalMembers) ||
                other.totalMembers == totalMembers) &&
            (identical(other.totalEngagement, totalEngagement) ||
                other.totalEngagement == totalEngagement) &&
            const DeepCollectionEquality().equals(other._eboard, _eboard) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastEventDate, lastEventDate) ||
                other.lastEventDate == lastEventDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      walletAddress,
      imageUrl,
      const DeepCollectionEquality().hash(_categories),
      eloRating,
      rank,
      totalEvents,
      totalMembers,
      totalEngagement,
      const DeepCollectionEquality().hash(_eboard),
      createdAt,
      lastEventDate);

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubImplCopyWith<_$ClubImpl> get copyWith =>
      __$$ClubImplCopyWithImpl<_$ClubImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubImplToJson(
      this,
    );
  }
}

abstract class _Club implements Club {
  const factory _Club(
      {required final String id,
      required final String name,
      required final String description,
      required final String walletAddress,
      required final String imageUrl,
      required final List<String> categories,
      required final int eloRating,
      required final int rank,
      required final int totalEvents,
      required final int totalMembers,
      required final int totalEngagement,
      required final List<String> eboard,
      required final DateTime createdAt,
      final DateTime? lastEventDate}) = _$ClubImpl;

  factory _Club.fromJson(Map<String, dynamic> json) = _$ClubImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get walletAddress;
  @override
  String get imageUrl;
  @override
  List<String> get categories;
  @override
  int get eloRating;
  @override
  int get rank;
  @override
  int get totalEvents;
  @override
  int get totalMembers;
  @override
  int get totalEngagement;
  @override
  List<String> get eboard;
  @override
  DateTime get createdAt;
  @override
  DateTime? get lastEventDate;

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClubImplCopyWith<_$ClubImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClubStats _$ClubStatsFromJson(Map<String, dynamic> json) {
  return _ClubStats.fromJson(json);
}

/// @nodoc
mixin _$ClubStats {
  String get clubId => throw _privateConstructorUsedError;
  int get weeklyEngagement => throw _privateConstructorUsedError;
  int get monthlyEngagement => throw _privateConstructorUsedError;
  int get totalEngagement => throw _privateConstructorUsedError;
  double get averageAttendance => throw _privateConstructorUsedError;
  List<TopMember> get topMembers => throw _privateConstructorUsedError;

  /// Serializes this ClubStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClubStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClubStatsCopyWith<ClubStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubStatsCopyWith<$Res> {
  factory $ClubStatsCopyWith(ClubStats value, $Res Function(ClubStats) then) =
      _$ClubStatsCopyWithImpl<$Res, ClubStats>;
  @useResult
  $Res call(
      {String clubId,
      int weeklyEngagement,
      int monthlyEngagement,
      int totalEngagement,
      double averageAttendance,
      List<TopMember> topMembers});
}

/// @nodoc
class _$ClubStatsCopyWithImpl<$Res, $Val extends ClubStats>
    implements $ClubStatsCopyWith<$Res> {
  _$ClubStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClubStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubId = null,
    Object? weeklyEngagement = null,
    Object? monthlyEngagement = null,
    Object? totalEngagement = null,
    Object? averageAttendance = null,
    Object? topMembers = null,
  }) {
    return _then(_value.copyWith(
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      weeklyEngagement: null == weeklyEngagement
          ? _value.weeklyEngagement
          : weeklyEngagement // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyEngagement: null == monthlyEngagement
          ? _value.monthlyEngagement
          : monthlyEngagement // ignore: cast_nullable_to_non_nullable
              as int,
      totalEngagement: null == totalEngagement
          ? _value.totalEngagement
          : totalEngagement // ignore: cast_nullable_to_non_nullable
              as int,
      averageAttendance: null == averageAttendance
          ? _value.averageAttendance
          : averageAttendance // ignore: cast_nullable_to_non_nullable
              as double,
      topMembers: null == topMembers
          ? _value.topMembers
          : topMembers // ignore: cast_nullable_to_non_nullable
              as List<TopMember>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubStatsImplCopyWith<$Res>
    implements $ClubStatsCopyWith<$Res> {
  factory _$$ClubStatsImplCopyWith(
          _$ClubStatsImpl value, $Res Function(_$ClubStatsImpl) then) =
      __$$ClubStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clubId,
      int weeklyEngagement,
      int monthlyEngagement,
      int totalEngagement,
      double averageAttendance,
      List<TopMember> topMembers});
}

/// @nodoc
class __$$ClubStatsImplCopyWithImpl<$Res>
    extends _$ClubStatsCopyWithImpl<$Res, _$ClubStatsImpl>
    implements _$$ClubStatsImplCopyWith<$Res> {
  __$$ClubStatsImplCopyWithImpl(
      _$ClubStatsImpl _value, $Res Function(_$ClubStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClubStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubId = null,
    Object? weeklyEngagement = null,
    Object? monthlyEngagement = null,
    Object? totalEngagement = null,
    Object? averageAttendance = null,
    Object? topMembers = null,
  }) {
    return _then(_$ClubStatsImpl(
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      weeklyEngagement: null == weeklyEngagement
          ? _value.weeklyEngagement
          : weeklyEngagement // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyEngagement: null == monthlyEngagement
          ? _value.monthlyEngagement
          : monthlyEngagement // ignore: cast_nullable_to_non_nullable
              as int,
      totalEngagement: null == totalEngagement
          ? _value.totalEngagement
          : totalEngagement // ignore: cast_nullable_to_non_nullable
              as int,
      averageAttendance: null == averageAttendance
          ? _value.averageAttendance
          : averageAttendance // ignore: cast_nullable_to_non_nullable
              as double,
      topMembers: null == topMembers
          ? _value._topMembers
          : topMembers // ignore: cast_nullable_to_non_nullable
              as List<TopMember>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubStatsImpl implements _ClubStats {
  const _$ClubStatsImpl(
      {required this.clubId,
      required this.weeklyEngagement,
      required this.monthlyEngagement,
      required this.totalEngagement,
      required this.averageAttendance,
      required final List<TopMember> topMembers})
      : _topMembers = topMembers;

  factory _$ClubStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubStatsImplFromJson(json);

  @override
  final String clubId;
  @override
  final int weeklyEngagement;
  @override
  final int monthlyEngagement;
  @override
  final int totalEngagement;
  @override
  final double averageAttendance;
  final List<TopMember> _topMembers;
  @override
  List<TopMember> get topMembers {
    if (_topMembers is EqualUnmodifiableListView) return _topMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topMembers);
  }

  @override
  String toString() {
    return 'ClubStats(clubId: $clubId, weeklyEngagement: $weeklyEngagement, monthlyEngagement: $monthlyEngagement, totalEngagement: $totalEngagement, averageAttendance: $averageAttendance, topMembers: $topMembers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubStatsImpl &&
            (identical(other.clubId, clubId) || other.clubId == clubId) &&
            (identical(other.weeklyEngagement, weeklyEngagement) ||
                other.weeklyEngagement == weeklyEngagement) &&
            (identical(other.monthlyEngagement, monthlyEngagement) ||
                other.monthlyEngagement == monthlyEngagement) &&
            (identical(other.totalEngagement, totalEngagement) ||
                other.totalEngagement == totalEngagement) &&
            (identical(other.averageAttendance, averageAttendance) ||
                other.averageAttendance == averageAttendance) &&
            const DeepCollectionEquality()
                .equals(other._topMembers, _topMembers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clubId,
      weeklyEngagement,
      monthlyEngagement,
      totalEngagement,
      averageAttendance,
      const DeepCollectionEquality().hash(_topMembers));

  /// Create a copy of ClubStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubStatsImplCopyWith<_$ClubStatsImpl> get copyWith =>
      __$$ClubStatsImplCopyWithImpl<_$ClubStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubStatsImplToJson(
      this,
    );
  }
}

abstract class _ClubStats implements ClubStats {
  const factory _ClubStats(
      {required final String clubId,
      required final int weeklyEngagement,
      required final int monthlyEngagement,
      required final int totalEngagement,
      required final double averageAttendance,
      required final List<TopMember> topMembers}) = _$ClubStatsImpl;

  factory _ClubStats.fromJson(Map<String, dynamic> json) =
      _$ClubStatsImpl.fromJson;

  @override
  String get clubId;
  @override
  int get weeklyEngagement;
  @override
  int get monthlyEngagement;
  @override
  int get totalEngagement;
  @override
  double get averageAttendance;
  @override
  List<TopMember> get topMembers;

  /// Create a copy of ClubStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClubStatsImplCopyWith<_$ClubStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopMember _$TopMemberFromJson(Map<String, dynamic> json) {
  return _TopMember.fromJson(json);
}

/// @nodoc
mixin _$TopMember {
  String get userId => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get eventsAttended => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this TopMember to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopMemberCopyWith<TopMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopMemberCopyWith<$Res> {
  factory $TopMemberCopyWith(TopMember value, $Res Function(TopMember) then) =
      _$TopMemberCopyWithImpl<$Res, TopMember>;
  @useResult
  $Res call(
      {String userId,
      String walletAddress,
      String displayName,
      int points,
      int eventsAttended,
      String? avatarUrl});
}

/// @nodoc
class _$TopMemberCopyWithImpl<$Res, $Val extends TopMember>
    implements $TopMemberCopyWith<$Res> {
  _$TopMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? walletAddress = null,
    Object? displayName = null,
    Object? points = null,
    Object? eventsAttended = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      eventsAttended: null == eventsAttended
          ? _value.eventsAttended
          : eventsAttended // ignore: cast_nullable_to_non_nullable
              as int,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopMemberImplCopyWith<$Res>
    implements $TopMemberCopyWith<$Res> {
  factory _$$TopMemberImplCopyWith(
          _$TopMemberImpl value, $Res Function(_$TopMemberImpl) then) =
      __$$TopMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String walletAddress,
      String displayName,
      int points,
      int eventsAttended,
      String? avatarUrl});
}

/// @nodoc
class __$$TopMemberImplCopyWithImpl<$Res>
    extends _$TopMemberCopyWithImpl<$Res, _$TopMemberImpl>
    implements _$$TopMemberImplCopyWith<$Res> {
  __$$TopMemberImplCopyWithImpl(
      _$TopMemberImpl _value, $Res Function(_$TopMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? walletAddress = null,
    Object? displayName = null,
    Object? points = null,
    Object? eventsAttended = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$TopMemberImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      eventsAttended: null == eventsAttended
          ? _value.eventsAttended
          : eventsAttended // ignore: cast_nullable_to_non_nullable
              as int,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopMemberImpl implements _TopMember {
  const _$TopMemberImpl(
      {required this.userId,
      required this.walletAddress,
      required this.displayName,
      required this.points,
      required this.eventsAttended,
      this.avatarUrl});

  factory _$TopMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopMemberImplFromJson(json);

  @override
  final String userId;
  @override
  final String walletAddress;
  @override
  final String displayName;
  @override
  final int points;
  @override
  final int eventsAttended;
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'TopMember(userId: $userId, walletAddress: $walletAddress, displayName: $displayName, points: $points, eventsAttended: $eventsAttended, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopMemberImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.eventsAttended, eventsAttended) ||
                other.eventsAttended == eventsAttended) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, walletAddress,
      displayName, points, eventsAttended, avatarUrl);

  /// Create a copy of TopMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopMemberImplCopyWith<_$TopMemberImpl> get copyWith =>
      __$$TopMemberImplCopyWithImpl<_$TopMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopMemberImplToJson(
      this,
    );
  }
}

abstract class _TopMember implements TopMember {
  const factory _TopMember(
      {required final String userId,
      required final String walletAddress,
      required final String displayName,
      required final int points,
      required final int eventsAttended,
      final String? avatarUrl}) = _$TopMemberImpl;

  factory _TopMember.fromJson(Map<String, dynamic> json) =
      _$TopMemberImpl.fromJson;

  @override
  String get userId;
  @override
  String get walletAddress;
  @override
  String get displayName;
  @override
  int get points;
  @override
  int get eventsAttended;
  @override
  String? get avatarUrl;

  /// Create a copy of TopMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopMemberImplCopyWith<_$TopMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
