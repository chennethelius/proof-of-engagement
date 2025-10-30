import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../events/domain/entities/event.dart';

// Provider for fetching all events
final eventsProvider = FutureProvider<List<Event>>((ref) async {
  // TODO: Replace with actual Solana service call
  // final solanaService = ref.read(solanaServiceProvider);
  // return await solanaService.fetchEvents();
  
  await Future.delayed(const Duration(milliseconds: 500));
  return _getMockEvents();
});

// Provider for fetching events by club ID
final clubEventsProvider = FutureProvider.family<List<Event>, String>((ref, clubId) async {
  // TODO: Replace with actual Solana service call
  await Future.delayed(const Duration(milliseconds: 300));
  final allEvents = _getMockEvents();
  return allEvents.where((event) => event.clubId == clubId).toList();
});

// Provider for fetching a specific event
final eventDetailProvider = FutureProvider.family<Event, String>((ref, eventId) async {
  // TODO: Replace with actual Solana service call
  await Future.delayed(const Duration(milliseconds: 300));
  final events = _getMockEvents();
  return events.firstWhere(
    (event) => event.id == eventId,
    orElse: () => events.first,
  );
});

// Provider for upcoming events
final upcomingEventsProvider = FutureProvider<List<Event>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 300));
  final events = _getMockEvents();
  final now = DateTime.now();
  return events.where((event) => event.startTime.isAfter(now)).toList();
});

// Provider for past events
final pastEventsProvider = FutureProvider<List<Event>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 300));
  final events = _getMockEvents();
  final now = DateTime.now();
  return events.where((event) => event.endTime.isBefore(now)).toList();
});

// Mock data helper
List<Event> _getMockEvents() {
  final now = DateTime.now();
  
  return [
    Event(
      id: 'event_1',
      clubId: 'club_1',
      name: 'Solana Workshop',
      description: 'Learn how to build on Solana blockchain',
      location: 'Tech Building Room 301',
      startTime: now.add(const Duration(days: 5)),
      endTime: now.add(const Duration(days: 5, hours: 2)),
      imageUrl: 'https://via.placeholder.com/300x200',
      maxCapacity: 50,
      currentAttendance: 42,
      status: EventStatus.upcoming,
      qrCodeData: 'event_1_qr_code_hash',
      createdAt: now.subtract(const Duration(days: 7)),
    ),
    Event(
      id: 'event_2',
      clubId: 'club_1',
      name: 'Web3 Hackathon',
      description: '24-hour hackathon building decentralized applications',
      location: 'Innovation Center',
      startTime: now.add(const Duration(days: 12)),
      endTime: now.add(const Duration(days: 13)),
      imageUrl: 'https://via.placeholder.com/300x200',
      maxCapacity: 100,
      currentAttendance: 35,
      status: EventStatus.upcoming,
      qrCodeData: 'event_2_qr_code_hash',
      createdAt: now.subtract(const Duration(days: 5)),
    ),
    Event(
      id: 'event_3',
      clubId: 'club_2',
      name: 'Machine Learning Workshop',
      description: 'Hands-on introduction to neural networks',
      location: 'Science Building Lab 205',
      startTime: now.add(const Duration(days: 8)),
      endTime: now.add(const Duration(days: 8, hours: 3)),
      imageUrl: 'https://via.placeholder.com/300x200',
      maxCapacity: 30,
      currentAttendance: 28,
      status: EventStatus.upcoming,
      qrCodeData: 'event_3_qr_code_hash',
      createdAt: now.subtract(const Duration(days: 10)),
    ),
    Event(
      id: 'event_4',
      clubId: 'club_3',
      name: 'Pitch Competition',
      description: 'Present your startup ideas to investors',
      location: 'Business School Auditorium',
      startTime: now.add(const Duration(days: 15)),
      endTime: now.add(const Duration(days: 15, hours: 4)),
      imageUrl: 'https://via.placeholder.com/300x200',
      maxCapacity: 200,
      currentAttendance: 87,
      status: EventStatus.upcoming,
      qrCodeData: 'event_4_qr_code_hash',
      createdAt: now.subtract(const Duration(days: 3)),
    ),
    Event(
      id: 'event_5',
      clubId: 'club_4',
      name: 'Robot Building Session',
      description: 'Work on robots for the upcoming competition',
      location: 'Engineering Workshop',
      startTime: now.add(const Duration(days: 3)),
      endTime: now.add(const Duration(days: 3, hours: 4)),
      imageUrl: 'https://via.placeholder.com/300x200',
      maxCapacity: 25,
      currentAttendance: 22,
      status: EventStatus.upcoming,
      qrCodeData: 'event_5_qr_code_hash',
      createdAt: now.subtract(const Duration(days: 12)),
    ),
  ];
}
