import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:convert';
import '../../../../core/theme/tokens/tokens.dart';
import '../../../../core/theme/widgets/widgets.dart';

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
              padding: EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Info Card
                  AppCard(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow(
                          context,
                          AppIcons.calendar,
                          'Date',
                          mockEvent['date'],
                          AppColors.accentBlue,
                        ),
                        Divider(height: AppSpacing.lg),
                        _buildInfoRow(
                          context,
                          AppIcons.time,
                          'Time',
                          mockEvent['time'],
                          AppColors.accentPink,
                        ),
                        Divider(height: AppSpacing.lg),
                        _buildInfoRow(
                          context,
                          AppIcons.location,
                          'Location',
                          mockEvent['location'],
                          AppColors.accentOrange,
                        ),
                        Divider(height: AppSpacing.lg),
                        _buildInfoRow(
                          context,
                          AppIcons.people,
                          'Capacity',
                          '${mockEvent['attending']}/${mockEvent['capacity']}',
                          AppColors.secondaryGreen,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.md),

                  // Description
                  Text(
                    'About This Event',
                    style: AppTypography.titleLarge(context),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  AppCard(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Text(
                      mockEvent['description'],
                      style: AppTypography.bodyMedium(context),
                    ),
                  ),
                  SizedBox(height: AppSpacing.md),

                  // QR Code Section (for club organizers)
                  if (mockEvent['isOrganizer'])
                    _buildQRCodeSection(context, mockEvent),

                  // Attendees Section
                  Text(
                    'Attendees (${mockEvent['attending']})',
                    style: AppTypography.titleLarge(context),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  AppCard(
                    child: Column(
                      children: List.generate(
                        5,
                        (index) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppColors.primaryPurple,
                            child: Text(
                              '${index + 1}',
                              style: AppTypography.labelMedium(context).copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          title: Text(
                            'Student ${index + 1}',
                            style: AppTypography.bodyLarge(context),
                          ),
                          subtitle: Text(
                            'Checked in',
                            style: AppTypography.bodySmall(context),
                          ),
                          trailing: Icon(
                            AppIcons.checkCircle,
                            color: AppColors.secondaryGreen,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.md),

                  // Photo Gallery (if event requires photos)
                  if (mockEvent['requiresPhoto'])
                    _buildPhotoGallery(context),

                  SizedBox(height: AppSpacing.xxxl * 2), // Space for FAB
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: AppButton.gradient(
        text: mockEvent['isOrganizer'] ? 'Show QR Code' : 'Check In',
        icon: mockEvent['isOrganizer'] ? AppIcons.qrCode : AppIcons.qrScan,
        onPressed: () {
          if (mockEvent['isOrganizer']) {
            _showQRDialog(context, mockEvent);
          } else {
            context.push('/events/$eventId/checkin');
          }
        },
        isFullWidth: false,
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value, Color color) {
    return Row(
      children: [
        Icon(icon, size: AppIconSize.md, color: color),
        SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTypography.bodySmall(context).copyWith(
                  color: AppColors.gray600,
                ),
              ),
              Text(
                value,
                style: AppTypography.bodyLarge(context).copyWith(
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
          style: AppTypography.titleLarge(context),
        ),
        SizedBox(height: AppSpacing.sm),
        AppCard.gradient(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
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
                  backgroundColor: AppColors.white,
                ),
              ),
              SizedBox(height: AppSpacing.md),
              Text(
                'Students scan this to check in',
                style: AppTypography.bodySmall(context).copyWith(
                  color: AppColors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.md),
      ],
    );
  }

  Widget _buildPhotoGallery(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Event Photos',
          style: AppTypography.titleLarge(context),
        ),
        SizedBox(height: AppSpacing.sm),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(right: AppSpacing.sm),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                child: Container(
                  width: 120,
                  color: AppColors.gray200,
                  child: Icon(
                    AppIcons.image,
                    size: AppIconSize.xxxl,
                    color: AppColors.gray400,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: AppSpacing.md),
      ],
    );
  }

  void _showQRDialog(BuildContext context, Map<String, dynamic> event) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Event QR Code',
                style: AppTypography.titleLarge(context),
              ),
              SizedBox(height: AppSpacing.md),
              Container(
                padding: EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
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
                  backgroundColor: AppColors.white,
                ),
              ),
              SizedBox(height: AppSpacing.md),
              Text(
                'Students can scan this to check in',
                style: AppTypography.bodySmall(context).copyWith(
                  color: AppColors.gray600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.md),
              AppButton.primary(
                text: 'Close',
                onPressed: () => Navigator.of(context).pop(),
                isFullWidth: true,
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