import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard.freezed.dart';
part 'leaderboard.g.dart';

@freezed
class LeaderboardEntry with _$LeaderboardEntry {
  const factory LeaderboardEntry({
    required int rank,
    required String clubId,
    required String clubName,
    required String clubImage,
    required int eloRating,
    required int totalEvents,
    required int totalMembers,
    required int totalEngagement,
    required double changePercentage,
    required RankChange rankChange,
  }) = _LeaderboardEntry;

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) => _$LeaderboardEntryFromJson(json);
}

enum RankChange {
  @JsonValue('up')
  up,
  @JsonValue('down')
  down,
  @JsonValue('same')
  same,
  @JsonValue('new')
  newEntry,
}

@freezed
class EloCalculation with _$EloCalculation {
  const factory EloCalculation({
    required String clubId,
    required int currentElo,
    required int newElo,
    required int eloDelta,
    required String reason,
    required DateTime calculatedAt,
  }) = _EloCalculation;

  factory EloCalculation.fromJson(Map<String, dynamic> json) => _$EloCalculationFromJson(json);
}

/// ELO Rating Formula for Clubs
/// Factors:
/// 1. Event frequency (consistency bonus)
/// 2. Average attendance per event
/// 3. Event photo proof quality (verified engagement)
/// 4. Member retention rate
/// 5. Growth rate (new members)
/// 6. Cross-club collaboration events
class EloFormula {
  static const int kFactor = 32;
  static const int baseRating = 1000;
  
  static int calculateNewRating({
    required int currentRating,
    required int eventsThisMonth,
    required double avgAttendanceRate,
    required bool hasEventProof,
    required double memberRetentionRate,
    required double growthRate,
  }) {
    // Calculate expected performance score
    double performanceScore = 0.0;
    
    // Event frequency (max 30 points)
    performanceScore += (eventsThisMonth * 5).clamp(0, 30).toDouble();
    
    // Attendance rate (max 25 points)
    performanceScore += avgAttendanceRate * 25;
    
    // Event proof (15 points)
    if (hasEventProof) performanceScore += 15;
    
    // Member retention (max 20 points)
    performanceScore += memberRetentionRate * 20;
    
    // Growth rate (max 10 points)
    performanceScore += growthRate * 10;
    
    // Normalize to 0-1 scale
    double normalizedScore = performanceScore / 100;
    
    // ELO calculation
    double expectedScore = 1 / (1 + pow(10, (1500 - currentRating) / 400));
    int ratingChange = (kFactor * (normalizedScore - expectedScore)).round();
    
    return currentRating + ratingChange;
  }
}

// Helper function for pow
double pow(num x, num exponent) {
  return x.toDouble() * exponent.toDouble();
}
