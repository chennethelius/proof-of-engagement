import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/tokens/tokens.dart';
import '../../../../core/theme/widgets/widgets.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Technology', 'Business', 'Engineering', 'Arts'];

  List<Map<String, dynamic>> _getMockLeaderboard() {
    return [
      {
        'id': 'club_1',
        'name': 'Blockchain Club',
        'rank': 1,
        'prevRank': 2,
        'eloRating': 1850,
        'category': 'Technology',
        'members': 87,
        'events': 24,
        'avgAttendance': 92,
      },
      {
        'id': 'club_2',
        'name': 'AI Research Group',
        'rank': 2,
        'prevRank': 1,
        'eloRating': 1720,
        'category': 'Technology',
        'members': 64,
        'events': 18,
        'avgAttendance': 88,
      },
      {
        'id': 'club_3',
        'name': 'Entrepreneurship Society',
        'rank': 3,
        'prevRank': 3,
        'eloRating': 1680,
        'category': 'Business',
        'members': 125,
        'events': 31,
        'avgAttendance': 85,
      },
      {
        'id': 'club_4',
        'name': 'Robotics Club',
        'rank': 4,
        'prevRank': 5,
        'eloRating': 1590,
        'category': 'Engineering',
        'members': 42,
        'events': 15,
        'avgAttendance': 90,
      },
      {
        'id': 'club_5',
        'name': 'Debate Society',
        'rank': 5,
        'prevRank': 4,
        'eloRating': 1520,
        'category': 'Arts',
        'members': 56,
        'events': 20,
        'avgAttendance': 82,
      },
    ];
  }

  List<Map<String, dynamic>> _getFilteredLeaderboard() {
    final leaderboard = _getMockLeaderboard();
    if (_selectedCategory == 'All') return leaderboard;
    return leaderboard.where((club) => club['category'] == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final leaderboard = _getFilteredLeaderboard();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Leaderboard',
          style: AppTypography.titleLarge(context),
        ),
        actions: [
          IconButton(
            icon: Icon(AppIcons.info, size: AppIconSize.md),
            onPressed: () => _showEloInfoDialog(),
          ),
          SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: Column(
        children: [
          // Category Filter
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = category == _selectedCategory;
                return Padding(
                  padding: EdgeInsets.only(right: AppSpacing.sm),
                  child: FilterChip(
                    label: Text(
                      category,
                      style: AppTypography.labelMedium(context).copyWith(
                        color: isSelected ? AppColors.white : AppColors.gray700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    selected: isSelected,
                    backgroundColor: AppColors.gray100,
                    selectedColor: AppColors.primaryPurple,
                    checkmarkColor: AppColors.white,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          // Top 3 Podium
          if (_selectedCategory == 'All')
            _buildPodium(leaderboard.take(3).toList()),

          // Leaderboard List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: leaderboard.length,
              itemBuilder: (context, index) {
                final club = leaderboard[index];
                return _buildLeaderboardCard(context, club);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPodium(List<Map<String, dynamic>> topClubs) {
    if (topClubs.length < 3) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 2nd Place
          _buildPodiumPlace(topClubs[1], 2, 120, Colors.grey[600]!),
          const SizedBox(width: 16),
          // 1st Place
          _buildPodiumPlace(topClubs[0], 1, 150, Colors.amber),
          const SizedBox(width: 16),
          // 3rd Place
          _buildPodiumPlace(topClubs[2], 3, 100, Colors.brown),
        ],
      ),
    );
  }

  Widget _buildPodiumPlace(Map<String, dynamic> club, int rank, double height, Color color) {
    return Column(
      children: [
        Icon(
          Icons.emoji_events,
          size: 40,
          color: color,
        ),
        const SizedBox(height: 8),
        Text(
          club['name'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          '${club['eloRating']} ELO',
          style: const TextStyle(fontSize: 11),
        ),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              '#$rank',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardCard(BuildContext context, Map<String, dynamic> club) {
    final rankChange = club['prevRank'] - club['rank'];
    final hasRankChange = rankChange != 0;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => context.push('/clubs/${club['id']}'),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Rank Badge
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: _getRankColor(club['rank']),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '#${club['rank']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Club Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            club['name'],
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (hasRankChange)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: rankChange > 0 ? Colors.green[100] : Colors.red[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  rankChange > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                                  size: 14,
                                  color: rankChange > 0 ? Colors.green : Colors.red,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  '${rankChange.abs()}',
                                  style: TextStyle(
                                    color: rankChange > 0 ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '${club['eloRating']} ELO',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Icon(Icons.people, size: 14),
                        const SizedBox(width: 4),
                        Text('${club['members']}', style: const TextStyle(fontSize: 12)),
                        const SizedBox(width: 12),
                        const Icon(Icons.event, size: 14),
                        const SizedBox(width: 4),
                        Text('${club['events']}', style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),

              // Stats
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${club['avgAttendance']}%',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Text(
                    'Attendance',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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

  void _showEloInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ELO Rating System'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'How is ELO calculated?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('ELO ratings are calculated based on:'),
              SizedBox(height: 8),
              Text('• Event Frequency (30%)'),
              Text('• Attendance Rate (25%)'),
              Text('• Photo Proof Quality (15%)'),
              Text('• Member Retention (20%)'),
              Text('• Growth Rate (10%)'),
              SizedBox(height: 16),
              Text(
                'Higher ratings indicate more active and engaged clubs.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}