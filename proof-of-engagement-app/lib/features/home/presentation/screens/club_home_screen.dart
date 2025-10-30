import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/services/phantom_wallet_service.dart';

class ClubHomeScreen extends ConsumerWidget {
  const ClubHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Club Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Show notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/profile'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Club Info Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Icon(
                        Icons.groups,
                        size: 40,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Club Name',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            walletState.publicKey?.substring(0, 20) ?? 'Unknown',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'ELO: 1250 • Rank #12',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Quick Stats
            Text(
              'Quick Stats',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    icon: Icons.event,
                    label: 'Events',
                    value: '12',
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    icon: Icons.people,
                    label: 'Members',
                    value: '87',
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    icon: Icons.trending_up,
                    label: 'Attendance',
                    value: '92%',
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Quick Actions
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _buildActionCard(
                  context,
                  icon: Icons.add_circle,
                  title: 'Create Event',
                  color: Theme.of(context).colorScheme.primary,
                  onTap: () => context.push('/events/create'),
                ),
                _buildActionCard(
                  context,
                  icon: Icons.qr_code_2,
                  title: 'Generate QR',
                  color: Colors.purple,
                  onTap: () {
                    // TODO: Generate QR for event
                  },
                ),
                _buildActionCard(
                  context,
                  icon: Icons.calendar_today,
                  title: 'My Events',
                  color: Colors.blue,
                  onTap: () => context.push('/events'),
                ),
                _buildActionCard(
                  context,
                  icon: Icons.people,
                  title: 'Members',
                  color: Colors.green,
                  onTap: () {
                    // TODO: View members
                  },
                ),
                _buildActionCard(
                  context,
                  icon: Icons.leaderboard,
                  title: 'Leaderboard',
                  color: Colors.orange,
                  onTap: () => context.push('/leaderboard'),
                ),
                _buildActionCard(
                  context,
                  icon: Icons.attach_money,
                  title: 'Apply for Funding',
                  color: Colors.teal,
                  onTap: () {
                    // TODO: Apply for funding
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Recent Events
            Text(
              'Recent Events',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            _buildEventCard(
              context,
              title: 'Club Meeting',
              date: 'Today, 6:00 PM',
              attendees: 45,
              capacity: 50,
            ),
            _buildEventCard(
              context,
              title: 'Workshop: Blockchain Basics',
              date: 'Tomorrow, 3:00 PM',
              attendees: 23,
              capacity: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(
    BuildContext context, {
    required String title,
    required String date,
    required int attendees,
    required int capacity,
  }) {
    final percentage = (attendees / capacity * 100).round();
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(
            Icons.event,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: attendees / capacity,
                    backgroundColor: Colors.grey[300],
                  ),
                ),
                const SizedBox(width: 8),
                Text('$attendees/$capacity ($percentage%)'),
              ],
            ),
          ],
        ),
        isThreeLine: true,
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // TODO: Navigate to event detail
        },
      ),
    );
  }
}
