import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/pending_requests/presentation/pages/pending_requests_page.dart';
import '../../features/employee_info/presentation/pages/employee_info_page.dart';
import '../../features/analytics/presentation/pages/analytics_page.dart';
import '../../features/travel_history/presentation/pages/travel_history_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../shared/presentation/widgets/main_layout.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/dashboard',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            name: 'dashboard',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DashboardPage(),
            ),
          ),
          GoRoute(
            path: '/pending-requests',
            name: 'pending-requests',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PendingRequestsPage(),
            ),
          ),
          GoRoute(
            path: '/employee-info',
            name: 'employee-info',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: EmployeeInfoPage(),
            ),
          ),
          GoRoute(
            path: '/analytics',
            name: 'analytics',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AnalyticsPage(),
            ),
          ),
          GoRoute(
            path: '/travel-history',
            name: 'travel-history',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TravelHistoryPage(),
            ),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfilePage(),
            ),
          ),
        ],
      ),
    ],
  );
});