// Helper file for building Solana program instructions
// This provides structure for future implementation with proper instruction encoding

import 'dart:convert';
import 'dart:typed_data';

class InstructionDiscriminators {
  // These are placeholders - actual discriminators will be computed from the IDL
  // Discriminator = first 8 bytes of SHA256("global:instruction_name")
  static const registerClub = [0, 1, 2, 3, 4, 5, 6, 7];
  static const createEvent = [0, 1, 2, 3, 4, 5, 6, 8];
  static const recordAttendance = [0, 1, 2, 3, 4, 5, 6, 9];
  static const calculateElo = [0, 1, 2, 3, 4, 5, 7, 0];
  static const joinClub = [0, 1, 2, 3, 4, 6, 7, 8];
  static const closeEvent = [0, 1, 2, 3, 5, 6, 7, 8];
}

class ProgramInstructions {
  /// Build register_club instruction data
  static Uint8List buildRegisterClub(String name, String description) {
    final builder = BytesBuilder();
    
    // Add discriminator
    builder.add(InstructionDiscriminators.registerClub);
    
    // Encode name (Borsh String: 4-byte length + UTF-8 bytes)
    final nameBytes = utf8.encode(name);
    final nameLength = ByteData(4)..setUint32(0, nameBytes.length, Endian.little);
    builder.add(nameLength.buffer.asUint8List());
    builder.add(nameBytes);
    
    // Encode description
    final descBytes = utf8.encode(description);
    final descLength = ByteData(4)..setUint32(0, descBytes.length, Endian.little);
    builder.add(descLength.buffer.asUint8List());
    builder.add(descBytes);
    
    return builder.toBytes();
  }
  
  /// Build create_event instruction data
  static Uint8List buildCreateEvent({
    required int eventId,
    required String name,
    required String description,
    required String location,
    required DateTime startTime,
    required DateTime endTime,
    required int maxCapacity,
  }) {
    final builder = BytesBuilder();
    
    // Add discriminator
    builder.add(InstructionDiscriminators.createEvent);
    
    // event_id (u64)
    final eventIdBytes = ByteData(8)..setUint64(0, eventId, Endian.little);
    builder.add(eventIdBytes.buffer.asUint8List());
    
    // name (String)
    final nameBytes = utf8.encode(name);
    final nameLength = ByteData(4)..setUint32(0, nameBytes.length, Endian.little);
    builder.add(nameLength.buffer.asUint8List());
    builder.add(nameBytes);
    
    // description (String)
    final descBytes = utf8.encode(description);
    final descLength = ByteData(4)..setUint32(0, descBytes.length, Endian.little);
    builder.add(descLength.buffer.asUint8List());
    builder.add(descBytes);
    
    // location (String)
    final locBytes = utf8.encode(location);
    final locLength = ByteData(4)..setUint32(0, locBytes.length, Endian.little);
    builder.add(locLength.buffer.asUint8List());
    builder.add(locBytes);
    
    // start_time (i64 - Unix timestamp)
    final startBytes = ByteData(8)
      ..setInt64(0, startTime.millisecondsSinceEpoch ~/ 1000, Endian.little);
    builder.add(startBytes.buffer.asUint8List());
    
    // end_time (i64)
    final endBytes = ByteData(8)
      ..setInt64(0, endTime.millisecondsSinceEpoch ~/ 1000, Endian.little);
    builder.add(endBytes.buffer.asUint8List());
    
    // max_capacity (u32)
    final capacityBytes = ByteData(4)
      ..setUint32(0, maxCapacity, Endian.little);
    builder.add(capacityBytes.buffer.asUint8List());
    
    return builder.toBytes();
  }
  
  /// Build record_attendance instruction data
  static Uint8List buildRecordAttendance(String photoHash) {
    final builder = BytesBuilder();
    
    // Add discriminator
    builder.add(InstructionDiscriminators.recordAttendance);
    
    // photo_hash (String)
    final hashBytes = utf8.encode(photoHash);
    final hashLength = ByteData(4)..setUint32(0, hashBytes.length, Endian.little);
    builder.add(hashLength.buffer.asUint8List());
    builder.add(hashBytes);
    
    return builder.toBytes();
  }
  
  /// Build calculate_elo instruction data
  static Uint8List buildCalculateElo(int engagementScore) {
    final builder = BytesBuilder();
    
    // Add discriminator
    builder.add(InstructionDiscriminators.calculateElo);
    
    // engagement_score (u32)
    final scoreBytes = ByteData(4)
      ..setUint32(0, engagementScore, Endian.little);
    builder.add(scoreBytes.buffer.asUint8List());
    
    return builder.toBytes();
  }
  
  /// Build join_club instruction data
  static Uint8List buildJoinClub() {
    final builder = BytesBuilder();
    
    // Add discriminator (no additional parameters)
    builder.add(InstructionDiscriminators.joinClub);
    
    return builder.toBytes();
  }
}

/// Helper class for deriving PDAs (Program Derived Addresses)
class PDAHelper {
  /// Derive Club PDA seeds
  static List<List<int>> clubSeeds(String authority, String clubName) {
    return [
      utf8.encode('club'),
      // authority bytes would be added here
      utf8.encode(clubName),
    ];
  }
  
  /// Derive Event PDA seeds
  static List<List<int>> eventSeeds(String clubPubkey, int eventId) {
    final eventIdBytes = ByteData(8)..setUint64(0, eventId, Endian.little);
    return [
      utf8.encode('event'),
      // club pubkey bytes would be added here
      eventIdBytes.buffer.asUint8List(),
    ];
  }
  
  /// Derive Attendance PDA seeds
  static List<List<int>> attendanceSeeds(String eventPubkey, String userPubkey) {
    return [
      utf8.encode('attendance'),
      // event pubkey bytes
      // user pubkey bytes
    ];
  }
  
  /// Derive Membership PDA seeds
  static List<List<int>> membershipSeeds(String clubPubkey, String userPubkey) {
    return [
      utf8.encode('membership'),
      // club pubkey bytes
      // user pubkey bytes
    ];
  }
}
