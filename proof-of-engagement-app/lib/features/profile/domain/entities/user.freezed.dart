// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  int get totalPoints => throw _privateConstructorUsedError;
  int get eventsAttended => throw _privateConstructorUsedError;
  List<String> get clubMemberships => throw _privateConstructorUsedError;
  List<String> get eboardPositions => throw _privateConstructorUsedError;
  DateTime? get lastActivity => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String walletAddress,
      String displayName,
      int totalPoints,
      int eventsAttended,
      List<String> clubMemberships,
      List<String> eboardPositions,
      DateTime? lastActivity,
      String? avatarUrl,
      String? email,
      DateTime createdAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? walletAddress = null,
    Object? displayName = null,
    Object? totalPoints = null,
    Object? eventsAttended = null,
    Object? clubMemberships = null,
    Object? eboardPositions = null,
    Object? lastActivity = freezed,
    Object? avatarUrl = freezed,
    Object? email = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      eventsAttended: null == eventsAttended
          ? _value.eventsAttended
          : eventsAttended // ignore: cast_nullable_to_non_nullable
              as int,
      clubMemberships: null == clubMemberships
          ? _value.clubMemberships
          : clubMemberships // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eboardPositions: null == eboardPositions
          ? _value.eboardPositions
          : eboardPositions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastActivity: freezed == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String walletAddress,
      String displayName,
      int totalPoints,
      int eventsAttended,
      List<String> clubMemberships,
      List<String> eboardPositions,
      DateTime? lastActivity,
      String? avatarUrl,
      String? email,
      DateTime createdAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? walletAddress = null,
    Object? displayName = null,
    Object? totalPoints = null,
    Object? eventsAttended = null,
    Object? clubMemberships = null,
    Object? eboardPositions = null,
    Object? lastActivity = freezed,
    Object? avatarUrl = freezed,
    Object? email = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      eventsAttended: null == eventsAttended
          ? _value.eventsAttended
          : eventsAttended // ignore: cast_nullable_to_non_nullable
              as int,
      clubMemberships: null == clubMemberships
          ? _value._clubMemberships
          : clubMemberships // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eboardPositions: null == eboardPositions
          ? _value._eboardPositions
          : eboardPositions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastActivity: freezed == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.walletAddress,
      required this.displayName,
      required this.totalPoints,
      required this.eventsAttended,
      required final List<String> clubMemberships,
      required final List<String> eboardPositions,
      this.lastActivity,
      this.avatarUrl,
      this.email,
      required this.createdAt})
      : _clubMemberships = clubMemberships,
        _eboardPositions = eboardPositions;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String walletAddress;
  @override
  final String displayName;
  @override
  final int totalPoints;
  @override
  final int eventsAttended;
  final List<String> _clubMemberships;
  @override
  List<String> get clubMemberships {
    if (_clubMemberships is EqualUnmodifiableListView) return _clubMemberships;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clubMemberships);
  }

  final List<String> _eboardPositions;
  @override
  List<String> get eboardPositions {
    if (_eboardPositions is EqualUnmodifiableListView) return _eboardPositions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eboardPositions);
  }

  @override
  final DateTime? lastActivity;
  @override
  final String? avatarUrl;
  @override
  final String? email;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'User(id: $id, walletAddress: $walletAddress, displayName: $displayName, totalPoints: $totalPoints, eventsAttended: $eventsAttended, clubMemberships: $clubMemberships, eboardPositions: $eboardPositions, lastActivity: $lastActivity, avatarUrl: $avatarUrl, email: $email, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.eventsAttended, eventsAttended) ||
                other.eventsAttended == eventsAttended) &&
            const DeepCollectionEquality()
                .equals(other._clubMemberships, _clubMemberships) &&
            const DeepCollectionEquality()
                .equals(other._eboardPositions, _eboardPositions) &&
            (identical(other.lastActivity, lastActivity) ||
                other.lastActivity == lastActivity) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      walletAddress,
      displayName,
      totalPoints,
      eventsAttended,
      const DeepCollectionEquality().hash(_clubMemberships),
      const DeepCollectionEquality().hash(_eboardPositions),
      lastActivity,
      avatarUrl,
      email,
      createdAt);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      required final String walletAddress,
      required final String displayName,
      required final int totalPoints,
      required final int eventsAttended,
      required final List<String> clubMemberships,
      required final List<String> eboardPositions,
      final DateTime? lastActivity,
      final String? avatarUrl,
      final String? email,
      required final DateTime createdAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get walletAddress;
  @override
  String get displayName;
  @override
  int get totalPoints;
  @override
  int get eventsAttended;
  @override
  List<String> get clubMemberships;
  @override
  List<String> get eboardPositions;
  @override
  DateTime? get lastActivity;
  @override
  String? get avatarUrl;
  @override
  String? get email;
  @override
  DateTime get createdAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserEngagement _$UserEngagementFromJson(Map<String, dynamic> json) {
  return _UserEngagement.fromJson(json);
}

/// @nodoc
mixin _$UserEngagement {
  String get userId => throw _privateConstructorUsedError;
  String get clubId => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get eventsAttended => throw _privateConstructorUsedError;
  bool get isEboard => throw _privateConstructorUsedError;
  DateTime get joinedAt => throw _privateConstructorUsedError;
  DateTime? get lastAttendance => throw _privateConstructorUsedError;

  /// Serializes this UserEngagement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserEngagement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEngagementCopyWith<UserEngagement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEngagementCopyWith<$Res> {
  factory $UserEngagementCopyWith(
          UserEngagement value, $Res Function(UserEngagement) then) =
      _$UserEngagementCopyWithImpl<$Res, UserEngagement>;
  @useResult
  $Res call(
      {String userId,
      String clubId,
      int points,
      int eventsAttended,
      bool isEboard,
      DateTime joinedAt,
      DateTime? lastAttendance});
}

/// @nodoc
class _$UserEngagementCopyWithImpl<$Res, $Val extends UserEngagement>
    implements $UserEngagementCopyWith<$Res> {
  _$UserEngagementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEngagement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? clubId = null,
    Object? points = null,
    Object? eventsAttended = null,
    Object? isEboard = null,
    Object? joinedAt = null,
    Object? lastAttendance = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      eventsAttended: null == eventsAttended
          ? _value.eventsAttended
          : eventsAttended // ignore: cast_nullable_to_non_nullable
              as int,
      isEboard: null == isEboard
          ? _value.isEboard
          : isEboard // ignore: cast_nullable_to_non_nullable
              as bool,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastAttendance: freezed == lastAttendance
          ? _value.lastAttendance
          : lastAttendance // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEngagementImplCopyWith<$Res>
    implements $UserEngagementCopyWith<$Res> {
  factory _$$UserEngagementImplCopyWith(_$UserEngagementImpl value,
          $Res Function(_$UserEngagementImpl) then) =
      __$$UserEngagementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String clubId,
      int points,
      int eventsAttended,
      bool isEboard,
      DateTime joinedAt,
      DateTime? lastAttendance});
}

/// @nodoc
class __$$UserEngagementImplCopyWithImpl<$Res>
    extends _$UserEngagementCopyWithImpl<$Res, _$UserEngagementImpl>
    implements _$$UserEngagementImplCopyWith<$Res> {
  __$$UserEngagementImplCopyWithImpl(
      _$UserEngagementImpl _value, $Res Function(_$UserEngagementImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEngagement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? clubId = null,
    Object? points = null,
    Object? eventsAttended = null,
    Object? isEboard = null,
    Object? joinedAt = null,
    Object? lastAttendance = freezed,
  }) {
    return _then(_$UserEngagementImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      eventsAttended: null == eventsAttended
          ? _value.eventsAttended
          : eventsAttended // ignore: cast_nullable_to_non_nullable
              as int,
      isEboard: null == isEboard
          ? _value.isEboard
          : isEboard // ignore: cast_nullable_to_non_nullable
              as bool,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastAttendance: freezed == lastAttendance
          ? _value.lastAttendance
          : lastAttendance // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEngagementImpl implements _UserEngagement {
  const _$UserEngagementImpl(
      {required this.userId,
      required this.clubId,
      required this.points,
      required this.eventsAttended,
      required this.isEboard,
      required this.joinedAt,
      this.lastAttendance});

  factory _$UserEngagementImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEngagementImplFromJson(json);

  @override
  final String userId;
  @override
  final String clubId;
  @override
  final int points;
  @override
  final int eventsAttended;
  @override
  final bool isEboard;
  @override
  final DateTime joinedAt;
  @override
  final DateTime? lastAttendance;

  @override
  String toString() {
    return 'UserEngagement(userId: $userId, clubId: $clubId, points: $points, eventsAttended: $eventsAttended, isEboard: $isEboard, joinedAt: $joinedAt, lastAttendance: $lastAttendance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEngagementImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.clubId, clubId) || other.clubId == clubId) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.eventsAttended, eventsAttended) ||
                other.eventsAttended == eventsAttended) &&
            (identical(other.isEboard, isEboard) ||
                other.isEboard == isEboard) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.lastAttendance, lastAttendance) ||
                other.lastAttendance == lastAttendance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, clubId, points,
      eventsAttended, isEboard, joinedAt, lastAttendance);

  /// Create a copy of UserEngagement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEngagementImplCopyWith<_$UserEngagementImpl> get copyWith =>
      __$$UserEngagementImplCopyWithImpl<_$UserEngagementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEngagementImplToJson(
      this,
    );
  }
}

abstract class _UserEngagement implements UserEngagement {
  const factory _UserEngagement(
      {required final String userId,
      required final String clubId,
      required final int points,
      required final int eventsAttended,
      required final bool isEboard,
      required final DateTime joinedAt,
      final DateTime? lastAttendance}) = _$UserEngagementImpl;

  factory _UserEngagement.fromJson(Map<String, dynamic> json) =
      _$UserEngagementImpl.fromJson;

  @override
  String get userId;
  @override
  String get clubId;
  @override
  int get points;
  @override
  int get eventsAttended;
  @override
  bool get isEboard;
  @override
  DateTime get joinedAt;
  @override
  DateTime? get lastAttendance;

  /// Create a copy of UserEngagement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEngagementImplCopyWith<_$UserEngagementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserStats _$UserStatsFromJson(Map<String, dynamic> json) {
  return _UserStats.fromJson(json);
}

/// @nodoc
mixin _$UserStats {
  String get userId => throw _privateConstructorUsedError;
  int get totalPoints => throw _privateConstructorUsedError;
  int get totalEvents => throw _privateConstructorUsedError;
  int get totalClubs => throw _privateConstructorUsedError;
  int get weeklyPoints => throw _privateConstructorUsedError;
  int get monthlyPoints => throw _privateConstructorUsedError;
  List<ClubEngagement> get clubEngagements =>
      throw _privateConstructorUsedError;

  /// Serializes this UserStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatsCopyWith<UserStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsCopyWith<$Res> {
  factory $UserStatsCopyWith(UserStats value, $Res Function(UserStats) then) =
      _$UserStatsCopyWithImpl<$Res, UserStats>;
  @useResult
  $Res call(
      {String userId,
      int totalPoints,
      int totalEvents,
      int totalClubs,
      int weeklyPoints,
      int monthlyPoints,
      List<ClubEngagement> clubEngagements});
}

/// @nodoc
class _$UserStatsCopyWithImpl<$Res, $Val extends UserStats>
    implements $UserStatsCopyWith<$Res> {
  _$UserStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalPoints = null,
    Object? totalEvents = null,
    Object? totalClubs = null,
    Object? weeklyPoints = null,
    Object? monthlyPoints = null,
    Object? clubEngagements = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalEvents: null == totalEvents
          ? _value.totalEvents
          : totalEvents // ignore: cast_nullable_to_non_nullable
              as int,
      totalClubs: null == totalClubs
          ? _value.totalClubs
          : totalClubs // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyPoints: null == weeklyPoints
          ? _value.weeklyPoints
          : weeklyPoints // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyPoints: null == monthlyPoints
          ? _value.monthlyPoints
          : monthlyPoints // ignore: cast_nullable_to_non_nullable
              as int,
      clubEngagements: null == clubEngagements
          ? _value.clubEngagements
          : clubEngagements // ignore: cast_nullable_to_non_nullable
              as List<ClubEngagement>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatsImplCopyWith<$Res>
    implements $UserStatsCopyWith<$Res> {
  factory _$$UserStatsImplCopyWith(
          _$UserStatsImpl value, $Res Function(_$UserStatsImpl) then) =
      __$$UserStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      int totalPoints,
      int totalEvents,
      int totalClubs,
      int weeklyPoints,
      int monthlyPoints,
      List<ClubEngagement> clubEngagements});
}

/// @nodoc
class __$$UserStatsImplCopyWithImpl<$Res>
    extends _$UserStatsCopyWithImpl<$Res, _$UserStatsImpl>
    implements _$$UserStatsImplCopyWith<$Res> {
  __$$UserStatsImplCopyWithImpl(
      _$UserStatsImpl _value, $Res Function(_$UserStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalPoints = null,
    Object? totalEvents = null,
    Object? totalClubs = null,
    Object? weeklyPoints = null,
    Object? monthlyPoints = null,
    Object? clubEngagements = null,
  }) {
    return _then(_$UserStatsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalEvents: null == totalEvents
          ? _value.totalEvents
          : totalEvents // ignore: cast_nullable_to_non_nullable
              as int,
      totalClubs: null == totalClubs
          ? _value.totalClubs
          : totalClubs // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyPoints: null == weeklyPoints
          ? _value.weeklyPoints
          : weeklyPoints // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyPoints: null == monthlyPoints
          ? _value.monthlyPoints
          : monthlyPoints // ignore: cast_nullable_to_non_nullable
              as int,
      clubEngagements: null == clubEngagements
          ? _value._clubEngagements
          : clubEngagements // ignore: cast_nullable_to_non_nullable
              as List<ClubEngagement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatsImpl implements _UserStats {
  const _$UserStatsImpl(
      {required this.userId,
      required this.totalPoints,
      required this.totalEvents,
      required this.totalClubs,
      required this.weeklyPoints,
      required this.monthlyPoints,
      required final List<ClubEngagement> clubEngagements})
      : _clubEngagements = clubEngagements;

  factory _$UserStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatsImplFromJson(json);

  @override
  final String userId;
  @override
  final int totalPoints;
  @override
  final int totalEvents;
  @override
  final int totalClubs;
  @override
  final int weeklyPoints;
  @override
  final int monthlyPoints;
  final List<ClubEngagement> _clubEngagements;
  @override
  List<ClubEngagement> get clubEngagements {
    if (_clubEngagements is EqualUnmodifiableListView) return _clubEngagements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clubEngagements);
  }

  @override
  String toString() {
    return 'UserStats(userId: $userId, totalPoints: $totalPoints, totalEvents: $totalEvents, totalClubs: $totalClubs, weeklyPoints: $weeklyPoints, monthlyPoints: $monthlyPoints, clubEngagements: $clubEngagements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.totalEvents, totalEvents) ||
                other.totalEvents == totalEvents) &&
            (identical(other.totalClubs, totalClubs) ||
                other.totalClubs == totalClubs) &&
            (identical(other.weeklyPoints, weeklyPoints) ||
                other.weeklyPoints == weeklyPoints) &&
            (identical(other.monthlyPoints, monthlyPoints) ||
                other.monthlyPoints == monthlyPoints) &&
            const DeepCollectionEquality()
                .equals(other._clubEngagements, _clubEngagements));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      totalPoints,
      totalEvents,
      totalClubs,
      weeklyPoints,
      monthlyPoints,
      const DeepCollectionEquality().hash(_clubEngagements));

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      __$$UserStatsImplCopyWithImpl<_$UserStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatsImplToJson(
      this,
    );
  }
}

abstract class _UserStats implements UserStats {
  const factory _UserStats(
      {required final String userId,
      required final int totalPoints,
      required final int totalEvents,
      required final int totalClubs,
      required final int weeklyPoints,
      required final int monthlyPoints,
      required final List<ClubEngagement> clubEngagements}) = _$UserStatsImpl;

  factory _UserStats.fromJson(Map<String, dynamic> json) =
      _$UserStatsImpl.fromJson;

  @override
  String get userId;
  @override
  int get totalPoints;
  @override
  int get totalEvents;
  @override
  int get totalClubs;
  @override
  int get weeklyPoints;
  @override
  int get monthlyPoints;
  @override
  List<ClubEngagement> get clubEngagements;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClubEngagement _$ClubEngagementFromJson(Map<String, dynamic> json) {
  return _ClubEngagement.fromJson(json);
}

/// @nodoc
mixin _$ClubEngagement {
  String get clubId => throw _privateConstructorUsedError;
  String get clubName => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get eventsAttended => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;

  /// Serializes this ClubEngagement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClubEngagement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClubEngagementCopyWith<ClubEngagement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubEngagementCopyWith<$Res> {
  factory $ClubEngagementCopyWith(
          ClubEngagement value, $Res Function(ClubEngagement) then) =
      _$ClubEngagementCopyWithImpl<$Res, ClubEngagement>;
  @useResult
  $Res call(
      {String clubId,
      String clubName,
      int points,
      int eventsAttended,
      int rank});
}

/// @nodoc
class _$ClubEngagementCopyWithImpl<$Res, $Val extends ClubEngagement>
    implements $ClubEngagementCopyWith<$Res> {
  _$ClubEngagementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClubEngagement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubId = null,
    Object? clubName = null,
    Object? points = null,
    Object? eventsAttended = null,
    Object? rank = null,
  }) {
    return _then(_value.copyWith(
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      eventsAttended: null == eventsAttended
          ? _value.eventsAttended
          : eventsAttended // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubEngagementImplCopyWith<$Res>
    implements $ClubEngagementCopyWith<$Res> {
  factory _$$ClubEngagementImplCopyWith(_$ClubEngagementImpl value,
          $Res Function(_$ClubEngagementImpl) then) =
      __$$ClubEngagementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clubId,
      String clubName,
      int points,
      int eventsAttended,
      int rank});
}

/// @nodoc
class __$$ClubEngagementImplCopyWithImpl<$Res>
    extends _$ClubEngagementCopyWithImpl<$Res, _$ClubEngagementImpl>
    implements _$$ClubEngagementImplCopyWith<$Res> {
  __$$ClubEngagementImplCopyWithImpl(
      _$ClubEngagementImpl _value, $Res Function(_$ClubEngagementImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClubEngagement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubId = null,
    Object? clubName = null,
    Object? points = null,
    Object? eventsAttended = null,
    Object? rank = null,
  }) {
    return _then(_$ClubEngagementImpl(
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      eventsAttended: null == eventsAttended
          ? _value.eventsAttended
          : eventsAttended // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubEngagementImpl implements _ClubEngagement {
  const _$ClubEngagementImpl(
      {required this.clubId,
      required this.clubName,
      required this.points,
      required this.eventsAttended,
      required this.rank});

  factory _$ClubEngagementImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubEngagementImplFromJson(json);

  @override
  final String clubId;
  @override
  final String clubName;
  @override
  final int points;
  @override
  final int eventsAttended;
  @override
  final int rank;

  @override
  String toString() {
    return 'ClubEngagement(clubId: $clubId, clubName: $clubName, points: $points, eventsAttended: $eventsAttended, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubEngagementImpl &&
            (identical(other.clubId, clubId) || other.clubId == clubId) &&
            (identical(other.clubName, clubName) ||
                other.clubName == clubName) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.eventsAttended, eventsAttended) ||
                other.eventsAttended == eventsAttended) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clubId, clubName, points, eventsAttended, rank);

  /// Create a copy of ClubEngagement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubEngagementImplCopyWith<_$ClubEngagementImpl> get copyWith =>
      __$$ClubEngagementImplCopyWithImpl<_$ClubEngagementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubEngagementImplToJson(
      this,
    );
  }
}

abstract class _ClubEngagement implements ClubEngagement {
  const factory _ClubEngagement(
      {required final String clubId,
      required final String clubName,
      required final int points,
      required final int eventsAttended,
      required final int rank}) = _$ClubEngagementImpl;

  factory _ClubEngagement.fromJson(Map<String, dynamic> json) =
      _$ClubEngagementImpl.fromJson;

  @override
  String get clubId;
  @override
  String get clubName;
  @override
  int get points;
  @override
  int get eventsAttended;
  @override
  int get rank;

  /// Create a copy of ClubEngagement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClubEngagementImplCopyWith<_$ClubEngagementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
