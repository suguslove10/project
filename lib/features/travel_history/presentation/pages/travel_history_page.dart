import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/presentation/widgets/metric_card.dart';
import '../widgets/travel_history_card.dart';
import '../../domain/models/travel_history.dart';

class TravelHistoryPage extends ConsumerWidget {
  const TravelHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final travelHistory = _getTravelHistory();
    final totalSpent = travelHistory.fold<double>(0, (sum, trip) => sum + trip.cost);
    final totalTrips = travelHistory.length;
    final avgCost = totalTrips > 0 ? totalSpent / totalTrips : 0.0;
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: AppConstants.spacing24),
          _buildSummaryCards(context, totalTrips, totalSpent, avgCost),
          const SizedBox(height: AppConstants.spacing32),
          _buildTravelHistoryList(context, travelHistory),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Travel History',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.spacing8),
        Text(
          'Your complete travel history with hotel and flight details',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCards(BuildContext context, int totalTrips, double totalSpent, double avgCost) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 768;
        final crossAxisCount = isTablet ? 4 : 2;
        
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: AppConstants.spacing16,
          mainAxisSpacing: AppConstants.spacing16,
          childAspectRatio: isTablet ? 1.2 : 1.5,
          children: const [
            MetricCard(
              title: 'Total Trips',
              value: '6',
              subtitle: 'This year',
              icon: LucideIcons.plane,
              borderColor: AppTheme.primaryColor,
            ),
            MetricCard(
              title: 'Total Spent',
              value: '\$18.1k',
              subtitle: 'All trips',
              icon: LucideIcons.dollarSign,
              borderColor: AppTheme.primaryColor,
            ),
            MetricCard(
              title: 'Avg Cost',
              value: '\$3,017',
              subtitle: 'Per trip',
              icon: LucideIcons.calendar,
              borderColor: AppTheme.secondaryColor,
            ),
            MetricCard(
              title: 'Status',
              value: '100%',
              subtitle: 'Completed',
              icon: LucideIcons.checkCircle,
              borderColor: AppTheme.secondaryColor,
            ),
          ],
        );
      },
    );
  }

  Widget _buildTravelHistoryList(BuildContext context, List<TravelHistory> travelHistory) {
    return Column(
      children: travelHistory.map((trip) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppConstants.spacing24),
          child: TravelHistoryCard(trip: trip),
        );
      }).toList(),
    );
  }

  List<TravelHistory> _getTravelHistory() {
    return [
      TravelHistory(
        id: '1',
        destination: 'London, UK',
        purpose: 'Client meeting and contract review',
        startDate: DateTime(2024, 5, 15),
        endDate: DateTime(2024, 5, 18),
        cost: 2850,
        status: 'completed',
        department: 'Management',
        hotel: HotelDetails(
          name: 'The Langham London',
          address: '1C Portland Place, Regent Street, London W1B 1JA',
          checkIn: DateTime(2024, 5, 15),
          checkOut: DateTime(2024, 5, 18),
          cost: 1200,
        ),
      ),
      TravelHistory(
        id: '2',
        destination: 'Singapore',
        purpose: 'Regional manager conference',
        startDate: DateTime(2024, 4, 22),
        endDate: DateTime(2024, 4, 25),
        cost: 3200,
        status: 'completed',
        department: 'Management',
        hotel: HotelDetails(
          name: 'Marina Bay Sands',
          address: '10 Bayfront Avenue, Singapore 018956',
          checkIn: DateTime(2024, 4, 22),
          checkOut: DateTime(2024, 4, 25),
          cost: 1800,
        ),
      ),
      TravelHistory(
        id: '3',
        destination: 'New York, USA',
        purpose: 'Board meeting and strategy session',
        startDate: DateTime(2024, 3, 10),
        endDate: DateTime(2024, 3, 14),
        cost: 3500,
        status: 'completed',
        department: 'Management',
        hotel: HotelDetails(
          name: 'The Plaza Hotel',
          address: '768 5th Ave, New York, NY 10019',
          checkIn: DateTime(2024, 3, 10),
          checkOut: DateTime(2024, 3, 14),
          cost: 2100,
        ),
      ),
      TravelHistory(
        id: '4',
        destination: 'Tokyo, Japan',
        purpose: 'Partnership negotiations',
        startDate: DateTime(2024, 2, 18),
        endDate: DateTime(2024, 2, 22),
        cost: 4100,
        status: 'completed',
        department: 'Management',
        hotel: HotelDetails(
          name: 'Park Hyatt Tokyo',
          address: '3-7-1-2 Nishi Shinjuku, Shinjuku City, Tokyo 163-1055',
          checkIn: DateTime(2024, 2, 18),
          checkOut: DateTime(2024, 2, 22),
          cost: 2800,
        ),
      ),
    ];
  }
}