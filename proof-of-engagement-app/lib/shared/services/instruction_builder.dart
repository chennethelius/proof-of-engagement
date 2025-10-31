import 'dart:convert';
import 'dart:typed_data';

/// Service for building Solana program instructions
/// Handles serialization of instruction data using Borsh encoding
class InstructionBuilder {
  /// Build RegisterClub instruction
  /// Instruction discriminator: 0 (u8)
  /// Data: name (String), description (String)
  static Uint8List buildRegisterClub({
    required String name,
    required String description,
  }) {
    final buffer = BytesBuilder();
    
    // Instruction discriminator (0 for RegisterClub)
    buffer.addByte(0);
    
    // Name (String): 4 bytes length + UTF-8 bytes
    final nameBytes = utf8.encode(name);
    buffer.add(_encodeU32(nameBytes.length));
    buffer.add(nameBytes);
    
    // Description (String): 4 bytes length + UTF-8 bytes
    final descBytes = utf8.encode(description);
    buffer.add(_encodeU32(descBytes.length));
    buffer.add(descBytes);
    
    return buffer.toBytes();
  }

  /// Build CreateEvent instruction
  /// Instruction discriminator: 1 (u8)
  /// Data: event_id (u64), name, description, location, start_time (i64), end_time (i64), max_capacity (u32)
  static Uint8List buildCreateEvent({
    required int eventId,
    required String name,
    required String description,
    required String location,
    required DateTime startTime,
    required DateTime endTime,
    required int maxCapacity,
  }) {
    final buffer = BytesBuilder();
    
    // Instruction discriminator (1 for CreateEvent)
    buffer.addByte(1);
    
    // Event ID (u64)
    buffer.add(_encodeU64(eventId));
    
    // Name (String)
    final nameBytes = utf8.encode(name);
    buffer.add(_encodeU32(nameBytes.length));
    buffer.add(nameBytes);
    
    // Description (String)
    final descBytes = utf8.encode(description);
    buffer.add(_encodeU32(descBytes.length));
    buffer.add(descBytes);
    
    // Location (String)
    final locBytes = utf8.encode(location);
    buffer.add(_encodeU32(locBytes.length));
    buffer.add(locBytes);
    
    // Start time (i64 - Unix timestamp in seconds)
    buffer.add(_encodeI64(startTime.millisecondsSinceEpoch ~/ 1000));
    
    // End time (i64)
    buffer.add(_encodeI64(endTime.millisecondsSinceEpoch ~/ 1000));
    
    // Max capacity (u32)
    buffer.add(_encodeU32(maxCapacity));
    
    return buffer.toBytes();
  }

  /// Build RecordAttendance instruction
  /// Instruction discriminator: 2 (u8)
  /// Data: photo_hash (String)
  static Uint8List buildRecordAttendance({
    required String photoHash,
  }) {
    final buffer = BytesBuilder();
    
    // Instruction discriminator (2 for RecordAttendance)
    buffer.addByte(2);
    
    // Photo hash (String)
    final hashBytes = utf8.encode(photoHash);
    buffer.add(_encodeU32(hashBytes.length));
    buffer.add(hashBytes);
    
    return buffer.toBytes();
  }

  /// Build CalculateElo instruction
  /// Instruction discriminator: 3 (u8)
  /// Data: engagement_score (u8)
  static Uint8List buildCalculateElo({
    required int engagementScore,
  }) {
    final buffer = BytesBuilder();
    
    // Instruction discriminator (3 for CalculateElo)
    buffer.addByte(3);
    
    // Engagement score (u8, 0-100)
    buffer.addByte(engagementScore);
    
    return buffer.toBytes();
  }

  /// Build JoinClub instruction
  /// Instruction discriminator: 4 (u8)
  /// No additional data needed
  static Uint8List buildJoinClub() {
    final buffer = BytesBuilder();
    
    // Instruction discriminator (4 for JoinClub)
    buffer.addByte(4);
    
    return buffer.toBytes();
  }

  /// Build CloseEvent instruction
  /// Instruction discriminator: 5 (u8)
  /// No additional data needed
  static Uint8List buildCloseEvent() {
    final buffer = BytesBuilder();
    
    // Instruction discriminator (5 for CloseEvent)
    buffer.addByte(5);
    
    return buffer.toBytes();
  }

  // Helper methods for encoding different data types

  static Uint8List _encodeU32(int value) {
    final bytes = Uint8List(4);
    final byteData = ByteData.view(bytes.buffer);
    byteData.setUint32(0, value, Endian.little);
    return bytes;
  }

  static Uint8List _encodeU64(int value) {
    final bytes = Uint8List(8);
    final byteData = ByteData.view(bytes.buffer);
    byteData.setUint64(0, value, Endian.little);
    return bytes;
  }

  static Uint8List _encodeI64(int value) {
    final bytes = Uint8List(8);
    final byteData = ByteData.view(bytes.buffer);
    byteData.setInt64(0, value, Endian.little);
    return bytes;
  }
}
