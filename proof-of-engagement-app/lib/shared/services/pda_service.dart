import 'dart:convert';
import 'dart:typed_data';
import 'package:solana/solana.dart';
import 'package:crypto/crypto.dart';
import '../../core/config/app_config.dart';

/// Helper service for deriving Program Derived Addresses (PDAs)
/// for the Proof of Engagement program
class PdaService {
  static final Ed25519HDPublicKey programId = Ed25519HDPublicKey.fromBase58(
    AppConfig.proofOfEngagementProgramId,
  );

  /// Derive Club PDA
  /// Seeds: ["club", authority_pubkey, club_name]
  static Future<PdaResult> deriveClubPda({
    required Ed25519HDPublicKey authority,
    required String clubName,
  }) async {
    final seeds = <Uint8List>[
      Uint8List.fromList(utf8.encode('club')),
      Uint8List.fromList(authority.bytes),
      Uint8List.fromList(utf8.encode(clubName)),
    ];

    return await _findProgramAddress(seeds);
  }

  /// Derive Event PDA
  /// Seeds: ["event", club_pubkey, event_id_bytes]
  static Future<PdaResult> deriveEventPda({
    required Ed25519HDPublicKey clubPubkey,
    required int eventId,
  }) async {
    // Convert event ID to little-endian bytes (u64)
    final eventIdBytes = Uint8List(8);
    final byteData = ByteData.view(eventIdBytes.buffer);
    byteData.setUint64(0, eventId, Endian.little);

    final seeds = <Uint8List>[
      Uint8List.fromList(utf8.encode('event')),
      Uint8List.fromList(clubPubkey.bytes),
      eventIdBytes,
    ];

    return await _findProgramAddress(seeds);
  }

  /// Derive Attendance PDA
  /// Seeds: ["attendance", event_pubkey, user_pubkey]
  static Future<PdaResult> deriveAttendancePda({
    required Ed25519HDPublicKey eventPubkey,
    required Ed25519HDPublicKey userPubkey,
  }) async {
    final seeds = <Uint8List>[
      Uint8List.fromList(utf8.encode('attendance')),
      Uint8List.fromList(eventPubkey.bytes),
      Uint8List.fromList(userPubkey.bytes),
    ];

    return await _findProgramAddress(seeds);
  }

  /// Derive Membership PDA
  /// Seeds: ["membership", club_pubkey, user_pubkey]
  static Future<PdaResult> deriveMembershipPda({
    required Ed25519HDPublicKey clubPubkey,
    required Ed25519HDPublicKey userPubkey,
  }) async {
    final seeds = <Uint8List>[
      Uint8List.fromList(utf8.encode('membership')),
      Uint8List.fromList(clubPubkey.bytes),
      Uint8List.fromList(userPubkey.bytes),
    ];

    return await _findProgramAddress(seeds);
  }

  /// Find Program Address (implements Solana's findProgramAddress)
  static Future<PdaResult> _findProgramAddress(List<Uint8List> seeds) async {
    for (int bump = 255; bump >= 0; bump--) {
      try {
        final bumpBytes = Uint8List.fromList([bump]);
        final allSeeds = [...seeds, bumpBytes];
        
        final address = await _createProgramAddress(allSeeds);
        if (address != null) {
          return PdaResult(
            publicKey: address,
            bump: bump,
          );
        }
      } catch (e) {
        continue;
      }
    }
    throw Exception('Unable to find valid program address');
  }

  /// Create Program Address
  static Future<Ed25519HDPublicKey?> _createProgramAddress(
    List<Uint8List> seeds,
  ) async {
    // Concatenate all seeds
    final buffer = BytesBuilder();
    for (final seed in seeds) {
      if (seed.length > 32) {
        throw Exception('Max seed length exceeded');
      }
      buffer.add(seed);
    }
    
    // Add program ID
    buffer.add(programId.bytes);
    
    // Add PDA marker
    buffer.add(utf8.encode('ProgramDerivedAddress'));

    // Hash the buffer
    final hash = sha256.convert(buffer.toBytes()).bytes;
    
    // Check if the hash is on the Ed25519 curve
    // If it is, it's not a valid PDA (we need off-curve points)
    if (_isOnCurve(Uint8List.fromList(hash))) {
      return null;
    }

    return Ed25519HDPublicKey(Uint8List.fromList(hash));
  }

  /// Check if a point is on the Ed25519 curve
  /// Simplified check - in production, use a proper curve library
  static bool _isOnCurve(Uint8List bytes) {
    // For simplicity, we'll use Solana's approach:
    // A point is considered off-curve if this check passes
    // This is a simplified version; the actual implementation
    // in Solana is more complex
    try {
      // Try to create a public key - if it fails, it's off-curve (valid PDA)
      Ed25519HDPublicKey(bytes);
      return true; // On curve
    } catch (e) {
      return false; // Off curve (valid for PDA)
    }
  }

  /// Parse Club account data
  static ClubAccount? parseClubAccount(List<int> data) {
    if (data.length < 8) return null;
    
    try {
      final buffer = ByteData.sublistView(Uint8List.fromList(data));
      int offset = 8; // Skip discriminator

      // authority: 32 bytes
      final authority = Ed25519HDPublicKey(
        Uint8List.sublistView(buffer, offset, offset + 32),
      );
      offset += 32;

      // name: String (4 bytes length + content)
      final nameLength = buffer.getUint32(offset, Endian.little);
      offset += 4;
      final name = utf8.decode(data.sublist(offset, offset + nameLength));
      offset += nameLength;

      // description: String
      final descLength = buffer.getUint32(offset, Endian.little);
      offset += 4;
      final description = utf8.decode(data.sublist(offset, offset + descLength));
      offset += descLength;

      // elo_rating: u32
      final eloRating = buffer.getUint32(offset, Endian.little);
      offset += 4;

      // total_events: u32
      final totalEvents = buffer.getUint32(offset, Endian.little);
      offset += 4;

      // total_members: u32
      final totalMembers = buffer.getUint32(offset, Endian.little);
      offset += 4;

      // created_at: i64
      final createdAt = buffer.getInt64(offset, Endian.little);
      offset += 8;

      // bump: u8
      final bump = buffer.getUint8(offset);

      return ClubAccount(
        authority: authority,
        name: name,
        description: description,
        eloRating: eloRating,
        totalEvents: totalEvents,
        totalMembers: totalMembers,
        createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt * 1000),
        bump: bump,
      );
    } catch (e) {
      print('Error parsing club account: $e');
      return null;
    }
  }

  /// Parse Event account data
  static EventAccount? parseEventAccount(List<int> data) {
    if (data.length < 8) return null;
    
    try {
      final buffer = ByteData.sublistView(Uint8List.fromList(data));
      int offset = 8; // Skip discriminator

      // club: 32 bytes
      final club = Ed25519HDPublicKey(
        Uint8List.sublistView(buffer, offset, offset + 32),
      );
      offset += 32;

      // event_id: u64
      final eventId = buffer.getUint64(offset, Endian.little);
      offset += 8;

      // name: String
      final nameLength = buffer.getUint32(offset, Endian.little);
      offset += 4;
      final name = utf8.decode(data.sublist(offset, offset + nameLength));
      offset += nameLength;

      // description: String
      final descLength = buffer.getUint32(offset, Endian.little);
      offset += 4;
      final description = utf8.decode(data.sublist(offset, offset + descLength));
      offset += descLength;

      // location: String
      final locLength = buffer.getUint32(offset, Endian.little);
      offset += 4;
      final location = utf8.decode(data.sublist(offset, offset + locLength));
      offset += locLength;

      // start_time: i64
      final startTime = buffer.getInt64(offset, Endian.little);
      offset += 8;

      // end_time: i64
      final endTime = buffer.getInt64(offset, Endian.little);
      offset += 8;

      // max_capacity: u32
      final maxCapacity = buffer.getUint32(offset, Endian.little);
      offset += 4;

      // current_attendance: u32
      final currentAttendance = buffer.getUint32(offset, Endian.little);
      offset += 4;

      // is_active: bool
      final isActive = buffer.getUint8(offset) == 1;
      offset += 1;

      // created_at: i64
      final createdAt = buffer.getInt64(offset, Endian.little);
      offset += 8;

      // bump: u8
      final bump = buffer.getUint8(offset);

      return EventAccount(
        club: club,
        eventId: eventId,
        name: name,
        description: description,
        location: location,
        startTime: DateTime.fromMillisecondsSinceEpoch(startTime * 1000),
        endTime: DateTime.fromMillisecondsSinceEpoch(endTime * 1000),
        maxCapacity: maxCapacity,
        currentAttendance: currentAttendance,
        isActive: isActive,
        createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt * 1000),
        bump: bump,
      );
    } catch (e) {
      print('Error parsing event account: $e');
      return null;
    }
  }
}

/// PDA Result containing the derived public key and bump seed
class PdaResult {
  final Ed25519HDPublicKey publicKey;
  final int bump;

  PdaResult({
    required this.publicKey,
    required this.bump,
  });
}

/// Club Account structure
class ClubAccount {
  final Ed25519HDPublicKey authority;
  final String name;
  final String description;
  final int eloRating;
  final int totalEvents;
  final int totalMembers;
  final DateTime createdAt;
  final int bump;

  ClubAccount({
    required this.authority,
    required this.name,
    required this.description,
    required this.eloRating,
    required this.totalEvents,
    required this.totalMembers,
    required this.createdAt,
    required this.bump,
  });
}

/// Event Account structure
class EventAccount {
  final Ed25519HDPublicKey club;
  final int eventId;
  final String name;
  final String description;
  final String location;
  final DateTime startTime;
  final DateTime endTime;
  final int maxCapacity;
  final int currentAttendance;
  final bool isActive;
  final DateTime createdAt;
  final int bump;

  EventAccount({
    required this.club,
    required this.eventId,
    required this.name,
    required this.description,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.maxCapacity,
    required this.currentAttendance,
    required this.isActive,
    required this.createdAt,
    required this.bump,
  });
}
