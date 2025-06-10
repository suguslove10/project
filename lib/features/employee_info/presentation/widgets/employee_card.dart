import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/presentation/widgets/status_badge.dart';
import '../../domain/models/employee.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  final VoidCallback onViewUpcomingTrips;

  const EmployeeCard({
    super.key,
    required this.employee,
    required this.onViewUpcomingTrips,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: AppConstants.spacing16),
            if (employee.currentTrip != null)
              _buildCurrentTrip(context)
            else
              _buildNoCurrentTrip(context),
            const SizedBox(height: AppConstants.spacing16),
            _buildUpcomingTrips(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: AppTheme.primaryColor,
          child: Text(
            employee.initials,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: AppConstants.spacing12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                employee.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${employee.department} • ${employee.email}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Total Trips',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
            Text(
              employee.totalTrips.toString(),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCurrentTrip(BuildContext context) {
    final trip = employee.currentTrip!;
    
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing16),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Current Trip',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryColor,
                ),
              ),
              const Spacer(),
              const StatusBadge(
                text: 'Active',
                type: BadgeType.primary,
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing12),
          Row(
            children: [
              Expanded(
                child: _buildTripDetail(
                  context,
                  LucideIcons.mapPin,
                  trip.destination,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing8),
          Row(
            children: [
              Expanded(
                child: _buildTripDetail(
                  context,
                  LucideIcons.calendar,
                  '${DateFormat('MMM dd').format(trip.startDate)} - ${DateFormat('MMM dd').format(trip.endDate)}',
                ),
              ),
              Expanded(
                child: _buildTripDetail(
                  context,
                  LucideIcons.dollarSign,
                  '\$${trip.budget.toStringAsFixed(0)}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNoCurrentTrip(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Text(
        'No current active trip',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }

  Widget _buildUpcomingTrips(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Upcoming trips:',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: employee.upcomingTrips.isNotEmpty ? onViewUpcomingTrips : null,
          child: StatusBadge(
            text: '${employee.upcomingTrips.length} scheduled',
            type: employee.upcomingTrips.isNotEmpty ? BadgeType.primary : BadgeType.secondary,
          ),
        ),
      ],
    );
  }

  Widget _buildTripDetail(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppTheme.primaryColor,
        ),
        const SizedBox(width: AppConstants.spacing8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}