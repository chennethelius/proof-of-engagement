import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../clubs/domain/entities/club.dart';

// Provider for fetching all clubs
final clubsProvider = FutureProvider<List<Club>>((ref) async {
  // TODO: Replace with actual Solana service call
  // final solanaService = ref.read(solanaServiceProvider);
  // return await solanaService.fetchClubs();
  
  // Mock data for now
  await Future.delayed(const Duration(milliseconds: 500));
  return _getMockClubs();
});

// Provider for fetching a specific club by ID
final clubDetailProvider = FutureProvider.family<Club, String>((ref, clubId) async {
  // TODO: Replace with actual Solana service call
  // final solanaService = ref.read(solanaServiceProvider);
  // return await solanaService.fetchClub(clubId);
  
  // Mock data for now
  await Future.delayed(const Duration(milliseconds: 300));
  final clubs = _getMockClubs();
  return clubs.firstWhere(
    (club) => club.id == clubId,
    orElse: () => clubs.first,
  );
});

// Provider for user's joined clubs
final myClubsProvider = FutureProvider<List<Club>>((ref) async {
  // TODO: Filter by user's wallet address
  await Future.delayed(const Duration(milliseconds: 300));
  final allClubs = _getMockClubs();
  return allClubs.take(2).toList(); // Mock: return first 2 clubs
});

// Search query state provider
final clubSearchQueryProvider = StateProvider<String>((ref) => '');

// Filtered clubs based on search
final filteredClubsProvider = Provider<AsyncValue<List<Club>>>((ref) {
  final clubsAsync = ref.watch(clubsProvider);
  final searchQuery = ref.watch(clubSearchQueryProvider);
  
  return clubsAsync.whenData((clubs) {
    if (searchQuery.isEmpty) return clubs;
    
    return clubs.where((club) {
      final nameLower = club.name.toLowerCase();
      final queryLower = searchQuery.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  });
});

// Mock data helper
List<Club> _getMockClubs() {
  return [
    Club(
      id: 'club_1',
      name: 'Blockchain Club',
      description: 'Learn about blockchain and Web3 technologies',
      walletAddress: '7xKXtg2CW87d97TXJSDpbD5jBkheTqA83TZRuJosgAsU',
      imageUrl: 'https://via.placeholder.com/150',
      categories: ['Technology', 'Web3'],
      eloRating: 1850,
      rank: 1,
      totalEvents: 24,
      totalMembers: 87,
      totalEngagement: 2100,
      eboard: ['Alice Johnson', 'Bob Smith', 'Carol Davis'],
      createdAt: DateTime.now().subtract(const Duration(days: 180)),
    ),
    Club(
      id: 'club_2',
      name: 'AI Research Group',
      description: 'Exploring artificial intelligence and machine learning',
      walletAddress: '8yLXtg2CW87d97TXJSDpbD5jBkheTqA83TZRuJosgAsV',
      imageUrl: 'https://via.placeholder.com/150',
      categories: ['Technology', 'AI'],
      eloRating: 1720,
      rank: 2,
      totalEvents: 18,
      totalMembers: 64,
      totalEngagement: 1800,
      eboard: ['David Wilson', 'Eva Martinez'],
      createdAt: DateTime.now().subtract(const Duration(days: 150)),
    ),
    Club(
      id: 'club_3',
      name: 'Entrepreneurship Society',
      description: 'Building the next generation of founders',
      walletAddress: '9zMXtg2CW87d97TXJSDpbD5jBkheTqA83TZRuJosgAsW',
      imageUrl: 'https://via.placeholder.com/150',
      categories: ['Business', 'Entrepreneurship'],
      eloRating: 1680,
      rank: 3,
      totalEvents: 31,
      totalMembers: 125,
      totalEngagement: 2600,
      eboard: ['Frank Brown', 'Grace Lee', 'Henry Chen'],
      createdAt: DateTime.now().subtract(const Duration(days: 200)),
    ),
    Club(
      id: 'club_4',
      name: 'Robotics Club',
      description: 'Designing and building robots for competitions',
      walletAddress: '1aNXtg2CW87d97TXJSDpbD5jBkheTqA83TZRuJosgAsX',
      imageUrl: 'https://via.placeholder.com/150',
      categories: ['Engineering', 'Robotics'],
      eloRating: 1590,
      rank: 4,
      totalEvents: 15,
      totalMembers: 42,
      totalEngagement: 1200,
      eboard: ['Ivy Taylor', 'Jack Anderson'],
      createdAt: DateTime.now().subtract(const Duration(days: 120)),
    ),
    Club(
      id: 'club_5',
      name: 'Debate Society',
      description: 'Sharpening critical thinking and public speaking',
      walletAddress: '2bOXtg2CW87d97TXJSDpbD5jBkheTqA83TZRuJosgAsY',
      imageUrl: 'https://via.placeholder.com/150',
      categories: ['Arts', 'Debate'],
      eloRating: 1520,
      rank: 5,
      totalEvents: 20,
      totalMembers: 56,
      totalEngagement: 1400,
      eboard: ['Karen White', 'Leo Martinez'],
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
    ),
  ];
}
