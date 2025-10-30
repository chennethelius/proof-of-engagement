import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../profile/domain/entities/user.dart';
import '../../../../shared/services/wallet_service.dart';

// Provider for current user
final currentUserProvider = StateProvider<User?>((ref) => null);

// Provider for user profile (fetches from blockchain)
final userProfileProvider = FutureProvider<User?>((ref) async {
  final walletState = ref.watch(walletServiceProvider);
  
  if (!walletState.isConnected || walletState.publicKey == null) {
    return null;
  }
  
  // TODO: Fetch user data from blockchain
  await Future.delayed(const Duration(milliseconds: 500));
  
  // Mock user data
  return User(
    id: 'user_1',
    walletAddress: walletState.publicKey!,
    displayName: 'Student ${walletState.publicKey!.substring(0, 6)}',
    totalPoints: 450,
    eventsAttended: 12,
    clubMemberships: ['club_1', 'club_2', 'club_3'],
    eboardPositions: [],
    avatarUrl: 'https://via.placeholder.com/150',
    email: null,
    createdAt: DateTime.now().subtract(const Duration(days: 60)),
  );
});

// Provider for user stats
final userStatsProvider = FutureProvider<UserStats?>((ref) async {
  final user = await ref.watch(userProfileProvider.future);
  
  if (user == null) return null;
  
  // TODO: Calculate real stats from blockchain
  await Future.delayed(const Duration(milliseconds: 300));
  
  return UserStats(
    userId: user.id,
    totalPoints: user.totalPoints,
    totalEvents: user.eventsAttended,
    totalClubs: user.clubMemberships.length,
    weeklyPoints: 85,
    monthlyPoints: 320,
    clubEngagements: [], // TODO: Populate with real data
  );
});

// Provider for user's attended events
final userEventsProvider = FutureProvider<List<String>>((ref) async {
  final user = await ref.watch(userProfileProvider.future);
  
  if (user == null) return [];
  
  // TODO: Fetch from blockchain
  await Future.delayed(const Duration(milliseconds: 300));
  
  // Mock attended event IDs
  return ['event_1', 'event_3', 'event_5'];
});

// Provider to check if user is a club admin
final isClubAdminProvider = FutureProvider.family<bool, String>((ref, clubId) async {
  final user = await ref.watch(userProfileProvider.future);
  
  if (user == null) return false;
  
  // TODO: Check blockchain for club admin status
  await Future.delayed(const Duration(milliseconds: 200));
  
  // Mock: First club only for testing
  return clubId == 'club_1';
});
