import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/presentation/widgets/status_badge.dart';
import '../../domain/models/travel_request.dart';

class RequestCard extends StatelessWidget {
  final TravelRequest request;
  final VoidCallback onViewDetails;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const RequestCard({
    super.key,
    required this.request,
    required this.onViewDetails,
    required this.onApprove,
    required this.onReject,
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
            _buildPurpose(context),
            const SizedBox(height: AppConstants.spacing16),
            _buildDetails(context),
            const SizedBox(height: AppConstants.spacing20),
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppTheme.secondaryColor,
          child: Icon(
            LucideIcons.user,
            size: 20,
            color: AppTheme.textSecondary,
          ),
        ),
        const SizedBox(width: AppConstants.spacing12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                request.employeeName,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                request.department,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
              Text(
                'Submitted ${DateFormat('MMM dd, yyyy').format(request.submittedDate)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        StatusBadge(
          text: request.priority.displayName,
          type: request.priority.badgeType,
        ),
      ],
    );
  }

  Widget _buildPurpose(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing12),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Purpose:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppConstants.spacing4),
          Text(
            request.purpose,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Column(
      children: [
        _buildDetailRow(
          context,
          LucideIcons.mapPin,
          request.destination,
        ),
        const SizedBox(height: AppConstants.spacing8),
        _buildDetailRow(
          context,
          LucideIcons.calendar,
          '${DateFormat('MMM dd, yyyy').format(request.startDate)} - ${DateFormat('MMM dd, yyyy').format(request.endDate)}',
        ),
        const SizedBox(height: AppConstants.spacing8),
        _buildDetailRow(
          context,
          LucideIcons.dollarSign,
          '\$${request.estimatedCost.toStringAsFixed(0)}',
        ),
      ],
    );
  }

  Widget _buildDetailRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppTheme.textMuted,
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

  Widget _buildActions(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 600;
        
        if (isNarrow) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton.icon(
                onPressed: onViewDetails,
                icon: const Icon(LucideIcons.fileText, size: 16),
                label: const Text('View Details'),
              ),
              const SizedBox(height: AppConstants.spacing8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: onApprove,
                      icon: const Icon(LucideIcons.checkCircle, size: 16),
                      label: const Text('Approve'),
                    ),
                  ),
                  const SizedBox(width: AppConstants.spacing8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onReject,
                      icon: const Icon(LucideIcons.xCircle, size: 16),
                      label: const Text('Reject'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.errorColor,
                        side: const BorderSide(color: AppTheme.errorColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Row(
            children: [
              OutlinedButton.icon(
                onPressed: onViewDetails,
                icon: const Icon(LucideIcons.fileText, size: 16),
                label: const Text('View Details'),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: onApprove,
                icon: const Icon(LucideIcons.checkCircle, size: 16),
                label: const Text('Approve'),
              ),
              const SizedBox(width: AppConstants.spacing8),
              OutlinedButton.icon(
                onPressed: onReject,
                icon: const Icon(LucideIcons.xCircle, size: 16),
                label: const Text('Reject'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.errorColor,
                  side: const BorderSide(color: AppTheme.errorColor),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}