import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/presentation/widgets/status_badge.dart';
import '../../domain/models/travel_history.dart';

class TravelHistoryCard extends StatelessWidget {
  final TravelHistory trip;

  const TravelHistoryCard({
    super.key,
    required this.trip,
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
            _buildTripDetails(context),
            if (trip.hotel != null) ...[
              const SizedBox(height: AppConstants.spacing16),
              _buildHotelDetails(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          LucideIcons.mapPin,
          size: 20,
          color: AppTheme.primaryColor,
        ),
        const SizedBox(width: AppConstants.spacing8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trip.destination,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                trip.purpose,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
        const StatusBadge(
          text: 'Completed',
          type: BadgeType.success,
          icon: LucideIcons.checkCircle,
        ),
      ],
    );
  }

  Widget _buildTripDetails(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildDetailItem(
                  context,
                  LucideIcons.calendar,
                  'Travel Dates',
                  '${DateFormat('MMM dd, yyyy').format(trip.startDate)} - ${DateFormat('MMM dd, yyyy').format(trip.endDate)}',
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing12),
          Row(
            children: [
              Expanded(
                child: _buildDetailItem(
                  context,
                  LucideIcons.dollarSign,
                  'Total Cost',
                  '\$${trip.cost.toStringAsFixed(0)}',
                ),
              ),
              Expanded(
                child: _buildDetailItem(
                  context,
                  LucideIcons.building,
                  'Department',
                  trip.department,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHotelDetails(BuildContext context) {
    if (trip.hotel == null) return const SizedBox.shrink();
    
    final hotel = trip.hotel!;
    
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                LucideIcons.building2,
                size: 16,
                color: AppTheme.primaryColor,
              ),
              const SizedBox(width: AppConstants.spacing8),
              Text(
                'Hotel Accommodation',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing12),
          Text(
            hotel.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppConstants.spacing4),
          Text(
            hotel.address,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: AppConstants.spacing12),
          Row(
            children: [
              Expanded(
                child: _buildDetailItem(
                  context,
                  LucideIcons.calendar,
                  'Check-in',
                  DateFormat('MMM dd, yyyy').format(hotel.checkIn),
                ),
              ),
              Expanded(
                child: _buildDetailItem(
                  context,
                  LucideIcons.calendar,
                  'Check-out',
                  DateFormat('MMM dd, yyyy').format(hotel.checkOut),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing8),
          _buildDetailItem(
            context,
            LucideIcons.dollarSign,
            'Hotel Cost',
            '\$${hotel.cost.toStringAsFixed(0)}',
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, IconData icon, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 14,
              color: AppTheme.textMuted,
            ),
            const SizedBox(width: AppConstants.spacing4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spacing4),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}