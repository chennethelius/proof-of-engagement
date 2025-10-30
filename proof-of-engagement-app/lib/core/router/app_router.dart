import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/connect_wallet_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/home/presentation/screens/club_home_screen.dart';
import '../../features/clubs/presentation/screens/clubs_list_screen.dart';
import '../../features/clubs/presentation/screens/club_detail_screen.dart';
import '../../features/clubs/presentation/screens/create_club_screen.dart';
import '../../features/events/presentation/screens/events_list_screen.dart';
import '../../features/events/presentation/screens/event_detail_screen.dart';
import '../../features/events/presentation/screens/create_event_screen.dart';
import '../../features/events/presentation/screens/checkin_screen.dart';
import '../../features/leaderboard/presentation/screens/leaderboard_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/connect-wallet',
        name: 'connect-wallet',
        builder: (context, state) => const ConnectWalletScreen(),
      ),
      GoRoute(
        path: '/student-home',
        name: 'student-home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/club-home',
        name: 'club-home',
        builder: (context, state) => const ClubHomeScreen(),
      ),
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/clubs',
        name: 'clubs',
        builder: (context, state) => const ClubsListScreen(),
        routes: [
          GoRoute(
            path: 'create',
            name: 'create-club',
            builder: (context, state) => const CreateClubScreen(),
          ),
          GoRoute(
            path: ':clubId',
            name: 'club-detail',
            builder: (context, state) {
              final clubId = state.pathParameters['clubId']!;
              return ClubDetailScreen(clubId: clubId);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/events',
        name: 'events',
        builder: (context, state) => const EventsListScreen(),
        routes: [
          GoRoute(
            path: 'create',
            name: 'create-event',
            builder: (context, state) {
              final clubId = state.uri.queryParameters['clubId'];
              return CreateEventScreen(clubId: clubId);
            },
          ),
          GoRoute(
            path: ':eventId',
            name: 'event-detail',
            builder: (context, state) {
              final eventId = state.pathParameters['eventId']!;
              return EventDetailScreen(eventId: eventId);
            },
          ),
          GoRoute(
            path: ':eventId/checkin',
            name: 'event-checkin',
            builder: (context, state) {
              final eventId = state.pathParameters['eventId']!;
              return CheckinScreen(eventId: eventId);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/leaderboard',
        name: 'leaderboard',
        builder: (context, state) => const LeaderboardScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
});
