import 'dart:convert';
import 'package:crypto/crypto.dart';

/// QR Code data structure for event check-ins
class EventQRData {
  final String eventId;
  final String eventPda;
  final String clubName;
  final String eventName;
  final DateTime generatedAt;
  final DateTime expiresAt;
  final String signature; // HMAC signature to prevent tampering

  EventQRData({
    required this.eventId,
    required this.eventPda,
    required this.clubName,
    required this.eventName,
    required this.generatedAt,
    required this.expiresAt,
    required this.signature,
  });

  /// Create QR data for an event
  factory EventQRData.create({
    required String eventId,
    required String eventPda,
    required String clubName,
    required String eventName,
    int expiryMinutes = 5,
  }) {
    final now = DateTime.now();
    final expiresAt = now.add(Duration(minutes: expiryMinutes));
    
    // Create signature to prevent tampering
    final dataToSign = '$eventId:$eventPda:$clubName:$eventName:${now.millisecondsSinceEpoch}:${expiresAt.millisecondsSinceEpoch}';
    final signature = _generateSignature(dataToSign);

    return EventQRData(
      eventId: eventId,
      eventPda: eventPda,
      clubName: clubName,
      eventName: eventName,
      generatedAt: now,
      expiresAt: expiresAt,
      signature: signature,
    );
  }

  /// Convert to JSON for QR code
  String toJson() {
    return jsonEncode({
      'v': 1, // Version
      'eid': eventId,
      'pda': eventPda,
      'club': clubName,
      'event': eventName,
      'gen': generatedAt.millisecondsSinceEpoch,
      'exp': expiresAt.millisecondsSinceEpoch,
      'sig': signature,
    });
  }

  /// Parse from QR code JSON
  factory EventQRData.fromJson(String jsonString) {
    final map = jsonDecode(jsonString) as Map<String, dynamic>;
    
    return EventQRData(
      eventId: map['eid'] as String,
      eventPda: map['pda'] as String,
      clubName: map['club'] as String,
      eventName: map['event'] as String,
      generatedAt: DateTime.fromMillisecondsSinceEpoch(map['gen'] as int),
      expiresAt: DateTime.fromMillisecondsSinceEpoch(map['exp'] as int),
      signature: map['sig'] as String,
    );
  }

  /// Verify QR code is valid and not expired
  bool isValid() {
    // Check expiration
    if (DateTime.now().isAfter(expiresAt)) {
      return false;
    }

    // Verify signature
    final dataToVerify = '$eventId:$eventPda:$clubName:$eventName:${generatedAt.millisecondsSinceEpoch}:${expiresAt.millisecondsSinceEpoch}';
    final expectedSignature = _generateSignature(dataToVerify);
    
    return signature == expectedSignature;
  }

  /// Check if QR code has expired
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  /// Time remaining before expiration
  Duration get timeRemaining {
    final now = DateTime.now();
    if (now.isAfter(expiresAt)) {
      return Duration.zero;
    }
    return expiresAt.difference(now);
  }

  /// Generate HMAC signature for data integrity
  static String _generateSignature(String data) {
    // In production, use a proper secret key
    // For MVP, use a simple hash
    final key = utf8.encode('proof_of_engagement_secret_key');
    final bytes = utf8.encode(data);
    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(bytes);
    return digest.toString();
  }
}

/// QR Code validation result
class QRValidationResult {
  final bool isValid;
  final String? error;
  final EventQRData? data;

  QRValidationResult.success(this.data)
      : isValid = true,
        error = null;

  QRValidationResult.error(this.error)
      : isValid = false,
        data = null;
}

/// Service for handling QR code operations
class QRCodeService {
  /// Generate QR code data for an event
  static EventQRData generateEventQR({
    required String eventId,
    required String eventPda,
    required String clubName,
    required String eventName,
    int expiryMinutes = 5,
  }) {
    return EventQRData.create(
      eventId: eventId,
      eventPda: eventPda,
      clubName: clubName,
      eventName: eventName,
      expiryMinutes: expiryMinutes,
    );
  }

  /// Validate scanned QR code
  static QRValidationResult validateQR(String qrData) {
    try {
      final eventData = EventQRData.fromJson(qrData);

      if (eventData.isExpired) {
        return QRValidationResult.error(
          'QR code has expired. Please ask the organizer to generate a new one.',
        );
      }

      if (!eventData.isValid()) {
        return QRValidationResult.error(
          'Invalid QR code. This code may have been tampered with.',
        );
      }

      return QRValidationResult.success(eventData);
    } catch (e) {
      return QRValidationResult.error(
        'Invalid QR code format. Please scan a valid event QR code.',
      );
    }
  }

  /// Check if QR code belongs to a specific event
  static bool isEventQR(String qrData, String eventId) {
    try {
      final eventData = EventQRData.fromJson(qrData);
      return eventData.eventId == eventId;
    } catch (e) {
      return false;
    }
  }
}
