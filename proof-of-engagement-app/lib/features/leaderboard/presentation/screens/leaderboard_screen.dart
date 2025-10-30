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
              padding: EdgeInsets.all(AppSpacing.md),
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
      padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 2nd Place
          _buildPodiumPlace(topClubs[1], 2, 120, Colors.grey[600]!),
          SizedBox(width: AppSpacing.md),
          // 1st Place
          _buildPodiumPlace(topClubs[0], 1, 150, Colors.amber),
          SizedBox(width: AppSpacing.md),
          // 3rd Place
          _buildPodiumPlace(topClubs[2], 3, 100, Colors.brown),
        ],
      ),
    );
  }

  Widget _buildPodiumPlace(Map<String, dynamic> club, int rank, double height, Color color) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            gradient: _getRankGradient(rank),
            shape: BoxShape.circle,
          ),
          child: Icon(
            AppIcons.trophy,
            size: AppIconSize.xl,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        SizedBox(
          width: 90,
          child: Text(
            club['name'],
            style: AppTypography.labelSmall(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: AppSpacing.xs),
        Text(
          '${club['eloRating']} ELO',
          style: AppTypography.labelSmall(context).copyWith(
            color: AppColors.gray600,
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        Container(
          width: 80,
          height: height,
          decoration: BoxDecoration(
            gradient: _getRankGradient(rank),
            borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusMD)),
          ),
          child: Center(
            child: Text(
              '#$rank',
              style: AppTypography.displaySmall(context).copyWith(
                color: AppColors.white,
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

    return AnimatedAppCard(
      margin: EdgeInsets.only(bottom: AppSpacing.sm),
      onTap: () => context.push('/clubs/${club['id']}'),
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            // Rank Badge
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: _getRankGradient(club['rank']),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              ),
              child: Center(
                child: Text(
                  '#${club['rank']}',
                  style: AppTypography.titleMedium(context).copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: AppSpacing.md),

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
                          style: AppTypography.titleMedium(context).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (hasRankChange)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: AppSpacing.xs,
                          ),
                          decoration: BoxDecoration(
                            color: (rankChange > 0 
                                ? AppColors.secondaryGreen 
                                : AppColors.error).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                rankChange > 0 ? AppIcons.trending : AppIcons.trendingDown,
                                size: AppIconSize.xs,
                                color: rankChange > 0 
                                    ? AppColors.secondaryGreen 
                                    : AppColors.error,
                              ),
                              SizedBox(width: AppSpacing.xs),
                              Text(
                                '${rankChange.abs()}',
                                style: AppTypography.labelSmall(context).copyWith(
                                  color: rankChange > 0 
                                      ? AppColors.secondaryGreen 
                                      : AppColors.error,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.xs),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.xs,
                    children: [
                      _buildStatChip(AppIcons.star, '${club['eloRating']} ELO', AppColors.accentOrange),
                      _buildStatChip(AppIcons.people, '${club['members']}', AppColors.accentBlue),
                      _buildStatChip(AppIcons.events, '${club['events']}', AppColors.accentPink),
                    ],
                  ),
                ],
              ),
            ),

            // Attendance Badge
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${club['avgAttendance']}%',
                  style: AppTypography.titleMedium(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryPurple,
                  ),
                ),
                Text(
                  'Attendance',
                  style: AppTypography.labelSmall(context).copyWith(
                    color: AppColors.gray600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatChip(IconData icon, String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppIconSize.xs, color: color),
          SizedBox(width: AppSpacing.xs),
          Text(
            label,
            style: AppTypography.labelSmall(context).copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Gradient _getRankGradient(int rank) {
    switch (rank) {
      case 1:
        return LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFA500)], // Gold
        );
      case 2:
        return LinearGradient(
          colors: [Color(0xFFC0C0C0), Color(0xFF808080)], // Silver
        );
      case 3:
        return LinearGradient(
          colors: [Color(0xFFCD7F32), Color(0xFF8B4513)], // Bronze
        );
      default:
        return LinearGradient(
          colors: [AppColors.primaryPurple, AppColors.primaryPurpleLight],
        );
    }
  }

  void _showEloInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('ELO Rating System', style: AppTypography.titleLarge(context)),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'How is ELO calculated?',
                style: AppTypography.bodyLarge(context).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSpacing.sm),
              Text('ELO ratings are calculated based on:', style: AppTypography.bodyMedium(context)),
              SizedBox(height: AppSpacing.sm),
              Text('• Event Frequency (30%)', style: AppTypography.bodyMedium(context)),
              Text('• Attendance Rate (25%)', style: AppTypography.bodyMedium(context)),
              Text('• Photo Proof Quality (15%)', style: AppTypography.bodyMedium(context)),
              Text('• Member Retention (20%)', style: AppTypography.bodyMedium(context)),
              Text('• Growth Rate (10%)', style: AppTypography.bodyMedium(context)),
              SizedBox(height: AppSpacing.md),
              Text(
                'Higher ratings indicate more active and engaged clubs.',
                style: AppTypography.bodyMedium(context).copyWith(
                  fontStyle: FontStyle.italic,
                  color: AppColors.gray600,
                ),
              ),
            ],
          ),
        ),
        actions: [
          AppButton.primary(
            text: 'Got it',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}