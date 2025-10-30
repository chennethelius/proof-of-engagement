import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:convert';

class EventDetailScreen extends ConsumerWidget {
  final String eventId;
  
  const EventDetailScreen({
    super.key,
    required this.eventId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Fetch actual event data from blockchain
    final mockEvent = _getMockEventData();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Image
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                mockEvent['name'],
                style: const TextStyle(
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.celebration,
                  size: 80,
                  color: Colors.white24,
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Info Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow(
                            context,
                            Icons.calendar_today,
                            'Date',
                            mockEvent['date'],
                          ),
                          const Divider(height: 24),
                          _buildInfoRow(
                            context,
                            Icons.access_time,
                            'Time',
                            mockEvent['time'],
                          ),
                          const Divider(height: 24),
                          _buildInfoRow(
                            context,
                            Icons.location_on,
                            'Location',
                            mockEvent['location'],
                          ),
                          const Divider(height: 24),
                          _buildInfoRow(
                            context,
                            Icons.people,
                            'Capacity',
                            '${mockEvent['attending']}/${mockEvent['capacity']}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  Text(
                    'About This Event',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(mockEvent['description']),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // QR Code Section (for club organizers)
                  if (mockEvent['isOrganizer'])
                    _buildQRCodeSection(context, mockEvent),

                  // Attendees Section
                  Text(
                    'Attendees (${mockEvent['attending']})',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Column(
                      children: List.generate(
                        5,
                        (index) => ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text('Student ${index + 1}'),
                          subtitle: const Text('Checked in'),
                          trailing: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Photo Gallery (if event requires photos)
                  if (mockEvent['requiresPhoto'])
                    _buildPhotoGallery(context),

                  const SizedBox(height: 80), // Space for FAB
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (mockEvent['isOrganizer']) {
            // Show QR code
            _showQRDialog(context, mockEvent);
          } else {
            // Go to check-in screen
            context.push('/events/$eventId/checkin');
          }
        },
        icon: Icon(mockEvent['isOrganizer'] ? Icons.qr_code : Icons.qr_code_scanner),
        label: Text(mockEvent['isOrganizer'] ? 'Show QR Code' : 'Check In'),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQRCodeSection(BuildContext context, Map<String, dynamic> event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Event QR Code',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: QrImageView(
                    data: jsonEncode({
                      'eventId': eventId,
                      'clubId': event['clubId'],
                      'name': event['name'],
                      'requiresPhoto': event['requiresPhoto'],
                    }),
                    version: QrVersions.auto,
                    size: 200.0,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Students scan this to check in',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildPhotoGallery(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Event Photos',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 120,
                  color: Colors.grey[300],
                  child: const Icon(Icons.photo, size: 48, color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _showQRDialog(BuildContext context, Map<String, dynamic> event) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Event QR Code',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: QrImageView(
                  data: jsonEncode({
                    'eventId': eventId,
                    'clubId': event['clubId'],
                    'name': event['name'],
                    'requiresPhoto': event['requiresPhoto'],
                  }),
                  version: QrVersions.auto,
                  size: 250.0,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Students can scan this to check in',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> _getMockEventData() {
    return {
      'eventId': eventId,
      'clubId': 'club_123',
      'name': 'Weekly Tech Meetup',
      'description': 'Join us for our weekly tech meetup where we discuss the latest in blockchain technology, web3, and decentralized applications. Great opportunity to network with fellow developers!',
      'date': 'Nov 5, 2025',
      'time': '6:00 PM - 8:00 PM',
      'location': 'Tech Building Room 301',
      'capacity': 50,
      'attending': 32,
      'requiresPhoto': true,
      'isOrganizer': false, // TODO: Check if user is organizer
    };
  }
}