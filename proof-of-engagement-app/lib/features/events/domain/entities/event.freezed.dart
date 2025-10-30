// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String get id => throw _privateConstructorUsedError;
  String get clubId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get maxCapacity => throw _privateConstructorUsedError;
  int get currentAttendance => throw _privateConstructorUsedError;
  EventStatus get status => throw _privateConstructorUsedError;
  String get qrCodeData => throw _privateConstructorUsedError;
  DateTime? get qrCodeExpiry => throw _privateConstructorUsedError;
  String? get blockchainTxHash => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String id,
      String clubId,
      String name,
      String description,
      String location,
      DateTime startTime,
      DateTime endTime,
      String imageUrl,
      int maxCapacity,
      int currentAttendance,
      EventStatus status,
      String qrCodeData,
      DateTime? qrCodeExpiry,
      String? blockchainTxHash,
      DateTime createdAt});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clubId = null,
    Object? name = null,
    Object? description = null,
    Object? location = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? imageUrl = null,
    Object? maxCapacity = null,
    Object? currentAttendance = null,
    Object? status = null,
    Object? qrCodeData = null,
    Object? qrCodeExpiry = freezed,
    Object? blockchainTxHash = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      maxCapacity: null == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      currentAttendance: null == currentAttendance
          ? _value.currentAttendance
          : currentAttendance // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatus,
      qrCodeData: null == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String,
      qrCodeExpiry: freezed == qrCodeExpiry
          ? _value.qrCodeExpiry
          : qrCodeExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blockchainTxHash: freezed == blockchainTxHash
          ? _value.blockchainTxHash
          : blockchainTxHash // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String clubId,
      String name,
      String description,
      String location,
      DateTime startTime,
      DateTime endTime,
      String imageUrl,
      int maxCapacity,
      int currentAttendance,
      EventStatus status,
      String qrCodeData,
      DateTime? qrCodeExpiry,
      String? blockchainTxHash,
      DateTime createdAt});
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clubId = null,
    Object? name = null,
    Object? description = null,
    Object? location = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? imageUrl = null,
    Object? maxCapacity = null,
    Object? currentAttendance = null,
    Object? status = null,
    Object? qrCodeData = null,
    Object? qrCodeExpiry = freezed,
    Object? blockchainTxHash = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$EventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      maxCapacity: null == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      currentAttendance: null == currentAttendance
          ? _value.currentAttendance
          : currentAttendance // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatus,
      qrCodeData: null == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String,
      qrCodeExpiry: freezed == qrCodeExpiry
          ? _value.qrCodeExpiry
          : qrCodeExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blockchainTxHash: freezed == blockchainTxHash
          ? _value.blockchainTxHash
          : blockchainTxHash // ignore: cast_nullable_to_non_nullable
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
class _$EventImpl implements _Event {
  const _$EventImpl(
      {required this.id,
      required this.clubId,
      required this.name,
      required this.description,
      required this.location,
      required this.startTime,
      required this.endTime,
      required this.imageUrl,
      required this.maxCapacity,
      required this.currentAttendance,
      required this.status,
      required this.qrCodeData,
      this.qrCodeExpiry,
      this.blockchainTxHash,
      required this.createdAt});

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  final String id;
  @override
  final String clubId;
  @override
  final String name;
  @override
  final String description;
  @override
  final String location;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String imageUrl;
  @override
  final int maxCapacity;
  @override
  final int currentAttendance;
  @override
  final EventStatus status;
  @override
  final String qrCodeData;
  @override
  final DateTime? qrCodeExpiry;
  @override
  final String? blockchainTxHash;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Event(id: $id, clubId: $clubId, name: $name, description: $description, location: $location, startTime: $startTime, endTime: $endTime, imageUrl: $imageUrl, maxCapacity: $maxCapacity, currentAttendance: $currentAttendance, status: $status, qrCodeData: $qrCodeData, qrCodeExpiry: $qrCodeExpiry, blockchainTxHash: $blockchainTxHash, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clubId, clubId) || other.clubId == clubId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.maxCapacity, maxCapacity) ||
                other.maxCapacity == maxCapacity) &&
            (identical(other.currentAttendance, currentAttendance) ||
                other.currentAttendance == currentAttendance) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.qrCodeData, qrCodeData) ||
                other.qrCodeData == qrCodeData) &&
            (identical(other.qrCodeExpiry, qrCodeExpiry) ||
                other.qrCodeExpiry == qrCodeExpiry) &&
            (identical(other.blockchainTxHash, blockchainTxHash) ||
                other.blockchainTxHash == blockchainTxHash) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      clubId,
      name,
      description,
      location,
      startTime,
      endTime,
      imageUrl,
      maxCapacity,
      currentAttendance,
      status,
      qrCodeData,
      qrCodeExpiry,
      blockchainTxHash,
      createdAt);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventImplToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {required final String id,
      required final String clubId,
      required final String name,
      required final String description,
      required final String location,
      required final DateTime startTime,
      required final DateTime endTime,
      required final String imageUrl,
      required final int maxCapacity,
      required final int currentAttendance,
      required final EventStatus status,
      required final String qrCodeData,
      final DateTime? qrCodeExpiry,
      final String? blockchainTxHash,
      required final DateTime createdAt}) = _$EventImpl;

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  @override
  String get id;
  @override
  String get clubId;
  @override
  String get name;
  @override
  String get description;
  @override
  String get location;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String get imageUrl;
  @override
  int get maxCapacity;
  @override
  int get currentAttendance;
  @override
  EventStatus get status;
  @override
  String get qrCodeData;
  @override
  DateTime? get qrCodeExpiry;
  @override
  String? get blockchainTxHash;
  @override
  DateTime get createdAt;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventAttendance _$EventAttendanceFromJson(Map<String, dynamic> json) {
  return _EventAttendance.fromJson(json);
}

/// @nodoc
mixin _$EventAttendance {
  String get id => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  DateTime get checkinTime => throw _privateConstructorUsedError;
  String get blockchainTxHash => throw _privateConstructorUsedError;
  int get pointsEarned => throw _privateConstructorUsedError;

  /// Serializes this EventAttendance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventAttendance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventAttendanceCopyWith<EventAttendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventAttendanceCopyWith<$Res> {
  factory $EventAttendanceCopyWith(
          EventAttendance value, $Res Function(EventAttendance) then) =
      _$EventAttendanceCopyWithImpl<$Res, EventAttendance>;
  @useResult
  $Res call(
      {String id,
      String eventId,
      String userId,
      String walletAddress,
      DateTime checkinTime,
      String blockchainTxHash,
      int pointsEarned});
}

/// @nodoc
class _$EventAttendanceCopyWithImpl<$Res, $Val extends EventAttendance>
    implements $EventAttendanceCopyWith<$Res> {
  _$EventAttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventAttendance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? userId = null,
    Object? walletAddress = null,
    Object? checkinTime = null,
    Object? blockchainTxHash = null,
    Object? pointsEarned = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      checkinTime: null == checkinTime
          ? _value.checkinTime
          : checkinTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      blockchainTxHash: null == blockchainTxHash
          ? _value.blockchainTxHash
          : blockchainTxHash // ignore: cast_nullable_to_non_nullable
              as String,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventAttendanceImplCopyWith<$Res>
    implements $EventAttendanceCopyWith<$Res> {
  factory _$$EventAttendanceImplCopyWith(_$EventAttendanceImpl value,
          $Res Function(_$EventAttendanceImpl) then) =
      __$$EventAttendanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String eventId,
      String userId,
      String walletAddress,
      DateTime checkinTime,
      String blockchainTxHash,
      int pointsEarned});
}

/// @nodoc
class __$$EventAttendanceImplCopyWithImpl<$Res>
    extends _$EventAttendanceCopyWithImpl<$Res, _$EventAttendanceImpl>
    implements _$$EventAttendanceImplCopyWith<$Res> {
  __$$EventAttendanceImplCopyWithImpl(
      _$EventAttendanceImpl _value, $Res Function(_$EventAttendanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventAttendance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? userId = null,
    Object? walletAddress = null,
    Object? checkinTime = null,
    Object? blockchainTxHash = null,
    Object? pointsEarned = null,
  }) {
    return _then(_$EventAttendanceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      checkinTime: null == checkinTime
          ? _value.checkinTime
          : checkinTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      blockchainTxHash: null == blockchainTxHash
          ? _value.blockchainTxHash
          : blockchainTxHash // ignore: cast_nullable_to_non_nullable
              as String,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventAttendanceImpl implements _EventAttendance {
  const _$EventAttendanceImpl(
      {required this.id,
      required this.eventId,
      required this.userId,
      required this.walletAddress,
      required this.checkinTime,
      required this.blockchainTxHash,
      required this.pointsEarned});

  factory _$EventAttendanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventAttendanceImplFromJson(json);

  @override
  final String id;
  @override
  final String eventId;
  @override
  final String userId;
  @override
  final String walletAddress;
  @override
  final DateTime checkinTime;
  @override
  final String blockchainTxHash;
  @override
  final int pointsEarned;

  @override
  String toString() {
    return 'EventAttendance(id: $id, eventId: $eventId, userId: $userId, walletAddress: $walletAddress, checkinTime: $checkinTime, blockchainTxHash: $blockchainTxHash, pointsEarned: $pointsEarned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventAttendanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.checkinTime, checkinTime) ||
                other.checkinTime == checkinTime) &&
            (identical(other.blockchainTxHash, blockchainTxHash) ||
                other.blockchainTxHash == blockchainTxHash) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, eventId, userId,
      walletAddress, checkinTime, blockchainTxHash, pointsEarned);

  /// Create a copy of EventAttendance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventAttendanceImplCopyWith<_$EventAttendanceImpl> get copyWith =>
      __$$EventAttendanceImplCopyWithImpl<_$EventAttendanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventAttendanceImplToJson(
      this,
    );
  }
}

abstract class _EventAttendance implements EventAttendance {
  const factory _EventAttendance(
      {required final String id,
      required final String eventId,
      required final String userId,
      required final String walletAddress,
      required final DateTime checkinTime,
      required final String blockchainTxHash,
      required final int pointsEarned}) = _$EventAttendanceImpl;

  factory _EventAttendance.fromJson(Map<String, dynamic> json) =
      _$EventAttendanceImpl.fromJson;

  @override
  String get id;
  @override
  String get eventId;
  @override
  String get userId;
  @override
  String get walletAddress;
  @override
  DateTime get checkinTime;
  @override
  String get blockchainTxHash;
  @override
  int get pointsEarned;

  /// Create a copy of EventAttendance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventAttendanceImplCopyWith<_$EventAttendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventProof _$EventProofFromJson(Map<String, dynamic> json) {
  return _EventProof.fromJson(json);
}

/// @nodoc
mixin _$EventProof {
  String get eventId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get ipfsHash => throw _privateConstructorUsedError;
  DateTime get uploadedAt => throw _privateConstructorUsedError;
  String get uploadedBy => throw _privateConstructorUsedError;
  int get attendanceCount => throw _privateConstructorUsedError;

  /// Serializes this EventProof to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventProof
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventProofCopyWith<EventProof> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventProofCopyWith<$Res> {
  factory $EventProofCopyWith(
          EventProof value, $Res Function(EventProof) then) =
      _$EventProofCopyWithImpl<$Res, EventProof>;
  @useResult
  $Res call(
      {String eventId,
      String imageUrl,
      String ipfsHash,
      DateTime uploadedAt,
      String uploadedBy,
      int attendanceCount});
}

/// @nodoc
class _$EventProofCopyWithImpl<$Res, $Val extends EventProof>
    implements $EventProofCopyWith<$Res> {
  _$EventProofCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventProof
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? imageUrl = null,
    Object? ipfsHash = null,
    Object? uploadedAt = null,
    Object? uploadedBy = null,
    Object? attendanceCount = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ipfsHash: null == ipfsHash
          ? _value.ipfsHash
          : ipfsHash // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploadedBy: null == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as String,
      attendanceCount: null == attendanceCount
          ? _value.attendanceCount
          : attendanceCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventProofImplCopyWith<$Res>
    implements $EventProofCopyWith<$Res> {
  factory _$$EventProofImplCopyWith(
          _$EventProofImpl value, $Res Function(_$EventProofImpl) then) =
      __$$EventProofImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      String imageUrl,
      String ipfsHash,
      DateTime uploadedAt,
      String uploadedBy,
      int attendanceCount});
}

/// @nodoc
class __$$EventProofImplCopyWithImpl<$Res>
    extends _$EventProofCopyWithImpl<$Res, _$EventProofImpl>
    implements _$$EventProofImplCopyWith<$Res> {
  __$$EventProofImplCopyWithImpl(
      _$EventProofImpl _value, $Res Function(_$EventProofImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventProof
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? imageUrl = null,
    Object? ipfsHash = null,
    Object? uploadedAt = null,
    Object? uploadedBy = null,
    Object? attendanceCount = null,
  }) {
    return _then(_$EventProofImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ipfsHash: null == ipfsHash
          ? _value.ipfsHash
          : ipfsHash // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploadedBy: null == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as String,
      attendanceCount: null == attendanceCount
          ? _value.attendanceCount
          : attendanceCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventProofImpl implements _EventProof {
  const _$EventProofImpl(
      {required this.eventId,
      required this.imageUrl,
      required this.ipfsHash,
      required this.uploadedAt,
      required this.uploadedBy,
      required this.attendanceCount});

  factory _$EventProofImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventProofImplFromJson(json);

  @override
  final String eventId;
  @override
  final String imageUrl;
  @override
  final String ipfsHash;
  @override
  final DateTime uploadedAt;
  @override
  final String uploadedBy;
  @override
  final int attendanceCount;

  @override
  String toString() {
    return 'EventProof(eventId: $eventId, imageUrl: $imageUrl, ipfsHash: $ipfsHash, uploadedAt: $uploadedAt, uploadedBy: $uploadedBy, attendanceCount: $attendanceCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventProofImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.ipfsHash, ipfsHash) ||
                other.ipfsHash == ipfsHash) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy) &&
            (identical(other.attendanceCount, attendanceCount) ||
                other.attendanceCount == attendanceCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, imageUrl, ipfsHash,
      uploadedAt, uploadedBy, attendanceCount);

  /// Create a copy of EventProof
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventProofImplCopyWith<_$EventProofImpl> get copyWith =>
      __$$EventProofImplCopyWithImpl<_$EventProofImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventProofImplToJson(
      this,
    );
  }
}

abstract class _EventProof implements EventProof {
  const factory _EventProof(
      {required final String eventId,
      required final String imageUrl,
      required final String ipfsHash,
      required final DateTime uploadedAt,
      required final String uploadedBy,
      required final int attendanceCount}) = _$EventProofImpl;

  factory _EventProof.fromJson(Map<String, dynamic> json) =
      _$EventProofImpl.fromJson;

  @override
  String get eventId;
  @override
  String get imageUrl;
  @override
  String get ipfsHash;
  @override
  DateTime get uploadedAt;
  @override
  String get uploadedBy;
  @override
  int get attendanceCount;

  /// Create a copy of EventProof
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventProofImplCopyWith<_$EventProofImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
