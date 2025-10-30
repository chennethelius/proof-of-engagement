import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../leaderboard/domain/entities/leaderboard.dart';
import '../../../clubs/data/providers/club_providers.dart';

// Provider for fetching leaderboard
final leaderboardProvider = FutureProvider<List<LeaderboardEntry>>((ref) async {
  // TODO: Replace with actual Solana service call
  // final solanaService = ref.read(solanaServiceProvider);
  // return await solanaService.fetchLeaderboard();
  
  // For now, convert clubs to leaderboard entries
  await Future.delayed(const Duration(milliseconds: 500));
  final clubsAsync = await ref.watch(clubsProvider.future);
  
  return clubsAsync.map((club) => LeaderboardEntry(
    rank: club.rank,
    clubId: club.id,
    clubName: club.name,
    clubImage: club.imageUrl,
    eloRating: club.eloRating,
    totalEvents: club.totalEvents,
    totalMembers: club.totalMembers,
    totalEngagement: club.totalEngagement,
    changePercentage: club.rank <= 2 ? 5.2 : -2.1, // Mock
    rankChange: club.rank == 1 ? RankChange.up : 
                club.rank == 2 ? RankChange.down : RankChange.same,
  )).toList();
});

// Category filter state provider
final leaderboardCategoryProvider = StateProvider<String>((ref) => 'All');

// Filtered leaderboard based on category
final filteredLeaderboardProvider = Provider<AsyncValue<List<LeaderboardEntry>>>((ref) {
  final leaderboardAsync = ref.watch(leaderboardProvider);
  final selectedCategory = ref.watch(leaderboardCategoryProvider);
  
  return leaderboardAsync.whenData((entries) {
    if (selectedCategory == 'All') return entries;
    
    // TODO: Filter by club category when we have that data
    // For now, return all entries
    return entries;
  });
});

// Provider for rank changes (comparing to previous week)
final rankChangesProvider = FutureProvider<Map<String, int>>((ref) async {
  // TODO: Fetch historical rank data from blockchain
  await Future.delayed(const Duration(milliseconds: 300));
  
  // Mock rank changes
  return {
    'club_1': 1,  // Went up 1 position
    'club_2': -1, // Went down 1 position
    'club_3': 0,  // No change
    'club_4': 1,  // Went up 1 position
    'club_5': -1, // Went down 1 position
  };
});
