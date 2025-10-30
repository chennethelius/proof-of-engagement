import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClubsListScreen extends StatefulWidget {
  const ClubsListScreen({super.key});

  @override
  State<ClubsListScreen> createState() => _ClubsListScreenState();
}

class _ClubsListScreenState extends State<ClubsListScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _getMockClubs() {
    final clubs = [
      {
        'id': 'club_1',
        'name': 'Blockchain Club',
        'description': 'Learn about blockchain and Web3 technologies',
        'members': 87,
        'eloRating': 1850,
        'rank': 1,
        'category': 'Technology',
        'events': 24,
      },
      {
        'id': 'club_2',
        'name': 'AI Research Group',
        'description': 'Exploring artificial intelligence and machine learning',
        'members': 64,
        'eloRating': 1720,
        'rank': 2,
        'category': 'Technology',
        'events': 18,
      },
      {
        'id': 'club_3',
        'name': 'Entrepreneurship Society',
        'description': 'Building the next generation of founders',
        'members': 125,
        'eloRating': 1680,
        'rank': 3,
        'category': 'Business',
        'events': 31,
      },
      {
        'id': 'club_4',
        'name': 'Robotics Club',
        'description': 'Designing and building robots for competitions',
        'members': 42,
        'eloRating': 1590,
        'rank': 4,
        'category': 'Engineering',
        'events': 15,
      },
      {
        'id': 'club_5',
        'name': 'Debate Society',
        'description': 'Sharpening critical thinking and public speaking',
        'members': 56,
        'eloRating': 1520,
        'rank': 5,
        'category': 'Arts',
        'events': 20,
      },
    ];

    if (_searchQuery.isEmpty) return clubs;
    
    return clubs.where((club) =>
      club['name'].toString().toLowerCase().contains(_searchQuery.toLowerCase()) ||
      club['description'].toString().toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final clubs = _getMockClubs();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clubs'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search clubs...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
        ),
      ),
      body: clubs.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No clubs found'),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: clubs.length,
              itemBuilder: (context, index) {
                final club = clubs[index];
                return _buildClubCard(context, club);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/clubs/create'),
        icon: const Icon(Icons.add),
        label: const Text('Create Club'),
      ),
    );
  }

  Widget _buildClubCard(BuildContext context, Map<String, dynamic> club) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => context.push('/clubs/${club['id']}'),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Rank Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getRankColor(club['rank']),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.emoji_events, size: 16, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          '#${club['rank']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Club Name
                  Expanded(
                    child: Text(
                      club['name'],
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // ELO Rating
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${club['eloRating']} ELO',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                club['description'],
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Chip(
                    label: Text(club['category']),
                    avatar: const Icon(Icons.category, size: 16),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                  ),
                  const SizedBox(width: 8),
                  _buildStatChip(
                    context,
                    Icons.people,
                    '${club['members']} members',
                  ),
                  const SizedBox(width: 8),
                  _buildStatChip(
                    context,
                    Icons.event,
                    '${club['events']} events',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatChip(BuildContext context, IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.grey[600]!;
      case 3:
        return Colors.brown;
      default:
        return Colors.blue;
    }
  }
}
