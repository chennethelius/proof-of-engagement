// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: json['id'] as String,
      clubId: json['clubId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      imageUrl: json['imageUrl'] as String,
      maxCapacity: (json['maxCapacity'] as num).toInt(),
      currentAttendance: (json['currentAttendance'] as num).toInt(),
      status: $enumDecode(_$EventStatusEnumMap, json['status']),
      qrCodeData: json['qrCodeData'] as String,
      qrCodeExpiry: json['qrCodeExpiry'] == null
          ? null
          : DateTime.parse(json['qrCodeExpiry'] as String),
      blockchainTxHash: json['blockchainTxHash'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clubId': instance.clubId,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'maxCapacity': instance.maxCapacity,
      'currentAttendance': instance.currentAttendance,
      'status': _$EventStatusEnumMap[instance.status]!,
      'qrCodeData': instance.qrCodeData,
      'qrCodeExpiry': instance.qrCodeExpiry?.toIso8601String(),
      'blockchainTxHash': instance.blockchainTxHash,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$EventStatusEnumMap = {
  EventStatus.upcoming: 'upcoming',
  EventStatus.ongoing: 'ongoing',
  EventStatus.completed: 'completed',
  EventStatus.cancelled: 'cancelled',
};

_$EventAttendanceImpl _$$EventAttendanceImplFromJson(
        Map<String, dynamic> json) =>
    _$EventAttendanceImpl(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      userId: json['userId'] as String,
      walletAddress: json['walletAddress'] as String,
      checkinTime: DateTime.parse(json['checkinTime'] as String),
      blockchainTxHash: json['blockchainTxHash'] as String,
      pointsEarned: (json['pointsEarned'] as num).toInt(),
    );

Map<String, dynamic> _$$EventAttendanceImplToJson(
        _$EventAttendanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'userId': instance.userId,
      'walletAddress': instance.walletAddress,
      'checkinTime': instance.checkinTime.toIso8601String(),
      'blockchainTxHash': instance.blockchainTxHash,
      'pointsEarned': instance.pointsEarned,
    };

_$EventProofImpl _$$EventProofImplFromJson(Map<String, dynamic> json) =>
    _$EventProofImpl(
      eventId: json['eventId'] as String,
      imageUrl: json['imageUrl'] as String,
      ipfsHash: json['ipfsHash'] as String,
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
      uploadedBy: json['uploadedBy'] as String,
      attendanceCount: (json['attendanceCount'] as num).toInt(),
    );

Map<String, dynamic> _$$EventProofImplToJson(_$EventProofImpl instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'imageUrl': instance.imageUrl,
      'ipfsHash': instance.ipfsHash,
      'uploadedAt': instance.uploadedAt.toIso8601String(),
      'uploadedBy': instance.uploadedBy,
      'attendanceCount': instance.attendanceCount,
    };
