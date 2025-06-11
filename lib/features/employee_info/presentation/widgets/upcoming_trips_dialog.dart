import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/presentation/widgets/status_badge.dart';
import '../../domain/models/employee.dart';

class UpcomingTripsDialog extends StatelessWidget {
  final Employee employee;

  const UpcomingTripsDialog({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            Expanded(
              child: _buildContent(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing24),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.borderColor),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            LucideIcons.plane,
            size: 20,
            color: AppTheme.primaryColor,
          ),
          const SizedBox(width: AppConstants.spacing8),
          Expanded(
            child: Text(
              'Upcoming Trips - ${employee.name}',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(LucideIcons.x),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (employee.upcomingTrips.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.spacing32),
          child: Text('No upcoming trips scheduled'),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.spacing24),
      itemCount: employee.upcomingTrips.length,
      itemBuilder: (context, index) {
        final trip = employee.upcomingTrips[index];
        return Container(
          margin: const EdgeInsets.only(bottom: AppConstants.spacing16),
          padding: const EdgeInsets.all(AppConstants.spacing16),
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.borderColor),
            borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      trip.destination,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const StatusBadge(
                    text: 'Scheduled',
                    type: BadgeType.primary,
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.spacing12),
              _buildTripDetail(
                context,
                LucideIcons.calendar,
                'Travel Dates',
                '${DateFormat('MMM dd, yyyy').format(trip.startDate)} - ${DateFormat('MMM dd, yyyy').format(trip.endDate)}',
              ),
              const SizedBox(height: AppConstants.spacing8),
              _buildTripDetail(
                context,
                LucideIcons.dollarSign,
                'Budget',
                '\$${trip.budget.toStringAsFixed(0)}',
              ),
              const SizedBox(height: AppConstants.spacing8),
              _buildTripDetail(
                context,
                LucideIcons.briefcase,
                'Purpose',
                trip.purpose,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTripDetail(BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppTheme.textMuted,
        ),
        const SizedBox(width: AppConstants.spacing8),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppTheme.textSecondary,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}