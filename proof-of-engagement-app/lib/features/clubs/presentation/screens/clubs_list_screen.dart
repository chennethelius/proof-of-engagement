import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/tokens/tokens.dart';
import '../../../../core/theme/widgets/widgets.dart';

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
        title: Text(
          'Clubs',
          style: AppTypography.titleLarge(context),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(AppSpacing.xxxl + AppSpacing.md),
          child: Padding(
            padding: AppSpacing.horizontal(AppSpacing.md),
            child: TextField(
              controller: _searchController,
              style: AppTypography.bodyMedium(context),
              decoration: InputDecoration(
                hintText: 'Search clubs...',
                hintStyle: AppTypography.bodyMedium(context).copyWith(
                  color: AppColors.gray500,
                ),
                prefixIcon: Icon(AppIcons.search, size: AppIconSize.md),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: Icon(AppIcons.close, size: AppIconSize.sm),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
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
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    AppIcons.searchOff,
                    size: AppIconSize.responsive(context, AppIconSize.xxxl * 1.5),
                    color: AppColors.gray400,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Text(
                    'No clubs found',
                    style: AppTypography.bodyLarge(context).copyWith(
                      color: AppColors.gray600,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(AppSpacing.md),
              itemCount: clubs.length,
              itemBuilder: (context, index) {
                return AppAnimations.fadeIn(
                  duration: AppAnimations.normal,
                  child: _buildClubCard(context, clubs[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/clubs/create'),
        icon: Icon(AppIcons.add),
        label: Text(
          'Create Club',
          style: AppTypography.labelLarge(context).copyWith(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primaryPurple,
      ),
    );
  }

  Widget _buildClubCard(BuildContext context, Map<String, dynamic> club) {
    return AnimatedAppCard(
      margin: EdgeInsets.only(bottom: AppSpacing.md),
      padding: EdgeInsets.all(AppSpacing.md),
      onTap: () => context.push('/clubs/${club['id']}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Rank Badge
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  gradient: _getRankGradient(club['rank']),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  boxShadow: [
                    BoxShadow(
                      color: _getRankColor(club['rank']).withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      AppIcons.trophy,
                      size: AppIconSize.sm,
                      color: AppColors.white,
                    ),
                    SizedBox(width: AppSpacing.xs),
                    Text(
                      '#${club['rank']}',
                      style: AppTypography.labelMedium(context).copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppSpacing.sm),
              // Club Name
              Expanded(
                child: Text(
                  club['name'],
                  style: AppTypography.titleMedium(context).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // ELO Rating
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryPurpleLight.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
                  border: Border.all(
                    color: AppColors.primaryPurple.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      AppIcons.trending,
                      size: AppIconSize.xs,
                      color: AppColors.primaryPurple,
                    ),
                    SizedBox(width: AppSpacing.xs),
                    Text(
                      '${club['eloRating']}',
                      style: AppTypography.labelSmall(context).copyWith(
                        color: AppColors.primaryPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.sm),
          Text(
            club['description'],
            style: AppTypography.bodyMedium(context).copyWith(
              color: AppColors.gray700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.xs,
            children: [
              _buildChip(
                context,
                icon: AppIcons.business,
                label: club['category'],
                color: AppColors.accentBlue,
              ),
              _buildStatChip(
                context,
                AppIcons.people,
                '${club['members']} members',
              ),
              _buildStatChip(
                context,
                AppIcons.events,
                '${club['events']} events',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
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

  Widget _buildStatChip(BuildContext context, IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppIconSize.xs, color: AppColors.gray600),
          SizedBox(width: AppSpacing.xs),
          Text(
            label,
            style: AppTypography.labelSmall(context).copyWith(
              color: AppColors.gray700,
            ),
          ),
        ],
      ),
    );
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return AppColors.rankGold;
      case 2:
        return AppColors.rankSilver;
      case 3:
        return AppColors.rankBronze;
      default:
        return AppColors.primaryPurple;
    }
  }

  LinearGradient _getRankGradient(int rank) {
    final color = _getRankColor(rank);
    return LinearGradient(
      colors: [color, color.withOpacity(0.7)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
