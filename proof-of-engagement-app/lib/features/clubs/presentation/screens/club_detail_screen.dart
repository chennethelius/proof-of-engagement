import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleMembership,
        icon: Icon(_isMember ? Icons.check : Icons.add),
        label: Text(_isMember ? 'Member' : 'Join Club'),
        backgroundColor: _isMember ? Colors.green : null,
      ),
    );
  }

  Widget _buildAboutTab(Map<String, dynamic> club) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Stats Card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatColumn('Rank', '#${club['rank']}', Icons.emoji_events),
                    _buildStatColumn('ELO', '${club['eloRating']}', Icons.star),
                    _buildStatColumn('Members', '${club['members']}', Icons.people),
                    _buildStatColumn('Events', '${club['totalEvents']}', Icons.event),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Description
        Text(
          'About',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(club['description']),
          ),
        ),
        const SizedBox(height: 16),

        // Category
        Text(
          'Category',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: const Icon(Icons.category),
            title: Text(club['category']),
          ),
        ),
      ],
    );
  }

  Widget _buildEventsTab(Map<String, dynamic> club) {
    final events = club['upcomingEvents'] as List;
    
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Events',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (_isMember)
              FilledButton.icon(
                onPressed: () => context.push('/events/create?clubId=${widget.clubId}'),
                icon: const Icon(Icons.add),
                label: const Text('Create'),
              ),
          ],
        ),
        const SizedBox(height: 16),
        ...events.map((event) => Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () => context.push('/events/${event['id']}'),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['name'],
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 8),
                      Text('${event['date']} at ${event['time']}'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16),
                      const SizedBox(width: 8),
                      Text(event['location']),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.people, size: 16),
                      const SizedBox(width: 8),
                      Text('${event['attending']} attending'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )),
      ],
    );
  }

  Widget _buildMembersTab(Map<String, dynamic> club) {
    final members = club['topMembers'] as List;
    
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Top Members',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        ...members.map((member) => Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _getRankColor(member['rank']),
              child: Text(
                '#${member['rank']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(member['name']),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '${member['points']} pts',
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
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