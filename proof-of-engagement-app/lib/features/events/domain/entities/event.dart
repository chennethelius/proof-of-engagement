import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String id,
    required String clubId,
    required String name,
    required String description,
    required String location,
    required DateTime startTime,
    required DateTime endTime,
    required String imageUrl,
    required int maxCapacity,
    required int currentAttendance,
    required EventStatus status,
    required String qrCodeData,
    DateTime? qrCodeExpiry,
    String? blockchainTxHash,
    required DateTime createdAt,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

enum EventStatus {
  @JsonValue('upcoming')
  upcoming,
  @JsonValue('ongoing')
  ongoing,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}

@freezed
class EventAttendance with _$EventAttendance {
  const factory EventAttendance({
    required String id,
    required String eventId,
    required String userId,
    required String walletAddress,
    required DateTime checkinTime,
    required String blockchainTxHash,
    required int pointsEarned,
  }) = _EventAttendance;

  factory EventAttendance.fromJson(Map<String, dynamic> json) => _$EventAttendanceFromJson(json);
}

@freezed
class EventProof with _$EventProof {
  const factory EventProof({
    required String eventId,
    required String imageUrl,
    required String ipfsHash,
    required DateTime uploadedAt,
    required String uploadedBy,
    required int attendanceCount,
  }) = _EventProof;

  factory EventProof.fromJson(Map<String, dynamic> json) => _$EventProofFromJson(json);
}
