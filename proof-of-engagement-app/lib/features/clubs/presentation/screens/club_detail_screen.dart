import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/tokens/tokens.dart';
import '../../../../core/theme/widgets/widgets.dart';

class ClubDetailScreen extends ConsumerStatefulWidget {
  final String clubId;
  
  const ClubDetailScreen({
    super.key,
    required this.clubId,
  });

  @override
  ConsumerState<ClubDetailScreen> createState() => _ClubDetailScreenState();
}

class _ClubDetailScreenState extends ConsumerState<ClubDetailScreen> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isMember = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Map<String, dynamic> _getMockClubData() {
    return {
      'id': widget.clubId,
      'name': 'Blockchain Club',
      'description': 'A community of blockchain enthusiasts, developers, and entrepreneurs exploring Web3 technologies and decentralized applications.',
      'category': 'Technology',
      'eloRating': 1850,
      'rank': 1,
      'members': 87,
      'totalEvents': 24,
      'upcomingEvents': [
        {
          'id': 'event_1',
          'name': 'Solana Workshop',
          'date': 'Nov 5, 2025',
          'time': '6:00 PM',
          'location': 'Tech Building 301',
          'attending': 42,
        },
        {
          'id': 'event_2',
          'name': 'Web3 Hackathon',
          'date': 'Nov 12, 2025',
          'time': '10:00 AM',
          'location': 'Innovation Center',
          'attending': 35,
        },
      ],
      'topMembers': [
        {'name': 'Alice Johnson', 'points': 450, 'rank': 1},
        {'name': 'Bob Smith', 'points': 420, 'rank': 2},
        {'name': 'Carol Davis', 'points': 380, 'rank': 3},
        {'name': 'David Wilson', 'points': 350, 'rank': 4},
        {'name': 'Eva Martinez', 'points': 320, 'rank': 5},
      ],
    };
  }

  void _toggleMembership() {
    setState(() {
      _isMember = !_isMember;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isMember ? 'Joined club successfully!' : 'Left club'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final club = _getMockClubData();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  club['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                      ],
                    ),
                  ),
                  child: const Icon(
                    Icons.groups,
                    size: 80,
                    color: Colors.white24,
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'About'),
                    Tab(text: 'Events'),
                    Tab(text: 'Members'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildAboutTab(club),
            _buildEventsTab(club),
            _buildMembersTab(club),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (_isMember)
            AppButton.outlined(
              text: 'Share',
              icon: AppIcons.share,
              onPressed: () {
                // TODO: Implement share
              },
            ),
          SizedBox(width: AppSpacing.sm),
          AppButton.primary(
            text: _isMember ? 'Member' : 'Join Club',
            icon: _isMember ? AppIcons.checkCircle : AppIcons.add,
            onPressed: _toggleMembership,
          ),
        ],
      ),
    );
  }

  Widget _buildAboutTab(Map<String, dynamic> club) {
    return ListView(
      padding: EdgeInsets.all(AppSpacing.md),
      children: [
        // Stats Card
        AppCard.gradient(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatColumn('Rank', '#${club['rank']}', AppIcons.trophy),
                  _buildStatColumn('ELO', '${club['eloRating']}', AppIcons.star),
                  _buildStatColumn('Members', '${club['members']}', AppIcons.people),
                  _buildStatColumn('Events', '${club['totalEvents']}', AppIcons.events),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.md),

        // Description
        Text(
          'About',
          style: AppTypography.titleLarge(context),
        ),
        SizedBox(height: AppSpacing.sm),
        AppCard(
          padding: EdgeInsets.all(AppSpacing.md),
          child: Text(
            club['description'],
            style: AppTypography.bodyMedium(context),
          ),
        ),
        SizedBox(height: AppSpacing.md),

        // Category
        Text(
          'Category',
          style: AppTypography.titleLarge(context),
        ),
        SizedBox(height: AppSpacing.sm),
        AppCard(
          child: ListTile(
            leading: Icon(AppIcons.clubs, color: AppColors.primaryPurple),
            title: Text(club['category'], style: AppTypography.bodyLarge(context)),
          ),
        ),
      ],
    );
  }

  Widget _buildEventsTab(Map<String, dynamic> club) {
    final events = club['upcomingEvents'] as List;
    
    return ListView(
      padding: EdgeInsets.all(AppSpacing.md),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Events',
              style: AppTypography.titleLarge(context),
            ),
            if (_isMember)
              AppButton.primary(
                text: 'Create',
                icon: AppIcons.add,
                onPressed: () => context.push('/events/create?clubId=${widget.clubId}'),
              ),
          ],
        ),
        SizedBox(height: AppSpacing.md),
        ...events.map((event) => AnimatedAppCard(
          margin: EdgeInsets.only(bottom: AppSpacing.sm),
          onTap: () => context.push('/events/${event['id']}'),
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['name'],
                  style: AppTypography.titleMedium(context).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Icon(AppIcons.calendar, size: AppIconSize.sm, color: AppColors.primaryPurple),
                    SizedBox(width: AppSpacing.sm),
                    Text(
                      '${event['date']} at ${event['time']}',
                      style: AppTypography.bodyMedium(context),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.xs),
                Row(
                  children: [
                    Icon(AppIcons.location, size: AppIconSize.sm, color: AppColors.accentPink),
                    SizedBox(width: AppSpacing.sm),
                    Text(event['location'], style: AppTypography.bodyMedium(context)),
                  ],
                ),
                SizedBox(height: AppSpacing.xs),
                Row(
                  children: [
                    Icon(AppIcons.people, size: AppIconSize.sm, color: AppColors.accentBlue),
                    SizedBox(width: AppSpacing.sm),
                    Text('${event['attending']} attending', style: AppTypography.bodyMedium(context)),
                  ],
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }

  Widget _buildMembersTab(Map<String, dynamic> club) {
    final members = club['topMembers'] as List;
    
    return ListView(
      padding: EdgeInsets.all(AppSpacing.md),
      children: [
        Text(
          'Top Members',
          style: AppTypography.titleLarge(context),
        ),
        SizedBox(height: AppSpacing.md),
        ...members.map((member) => AnimatedAppCard(
          margin: EdgeInsets.only(bottom: AppSpacing.sm),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _getRankColor(member['rank']),
              child: Text(
                '#${member['rank']}',
                style: AppTypography.labelMedium(context).copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(member['name'], style: AppTypography.bodyLarge(context)),
            trailing: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.accentOrange.withOpacity(0.15),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(AppIcons.star, size: AppIconSize.xs, color: AppColors.accentOrange),
                  SizedBox(width: AppSpacing.xs),
                  Text(
                    '${member['points']} pts',
                    style: AppTypography.labelMedium(context).copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.accentOrange,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ],
    );
  }

  Widget _buildStatColumn(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.white, size: AppIconSize.lg),
        SizedBox(height: AppSpacing.sm),
        Text(
          value,
          style: AppTypography.titleLarge(context).copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        Text(
          label,
          style: AppTypography.bodySmall(context).copyWith(
            color: AppColors.white.withOpacity(0.8),
          ),
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

// Helper class for sticky tab bar
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}