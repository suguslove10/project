import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/presentation/widgets/status_badge.dart';
import '../../domain/models/travel_request.dart';

class RequestDetailsDialog extends StatefulWidget {
  final TravelRequest request;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const RequestDetailsDialog({
    super.key,
    required this.request,
    required this.onApprove,
    required this.onReject,
  });

  @override
  State<RequestDetailsDialog> createState() => _RequestDetailsDialogState();
}

class _RequestDetailsDialogState extends State<RequestDetailsDialog> {
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

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
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppConstants.spacing24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEmployeeInfo(context),
                    const SizedBox(height: AppConstants.spacing24),
                    _buildTravelDetails(context),
                    const SizedBox(height: AppConstants.spacing24),
                    _buildPurposeAndDetails(context),
                    const SizedBox(height: AppConstants.spacing24),
                    _buildNotesSection(context),
                  ],
                ),
              ),
            ),
            _buildActions(context),
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
          Expanded(
            child: Text(
              'Request Details - ${widget.request.employeeName}',
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

  Widget _buildEmployeeInfo(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildInfoCard(
            context,
            'Employee',
            widget.request.employeeName,
          ),
        ),
        const SizedBox(width: AppConstants.spacing16),
        Expanded(
          child: _buildInfoCard(
            context,
            'Department',
            widget.request.department,
          ),
        ),
      ],
    );
  }

  Widget _buildTravelDetails(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildInfoCard(
                context,
                'Destination',
                widget.request.destination,
              ),
            ),
            const SizedBox(width: AppConstants.spacing16),
            Expanded(
              child: _buildInfoCard(
                context,
                'Estimated Cost',
                '\$${widget.request.estimatedCost.toStringAsFixed(0)}',
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spacing16),
        Row(
          children: [
            Expanded(
              child: _buildInfoCard(
                context,
                'Travel Dates',
                '${DateFormat('MMM dd, yyyy').format(widget.request.startDate)} - ${DateFormat('MMM dd, yyyy').format(widget.request.endDate)}',
              ),
            ),
            const SizedBox(width: AppConstants.spacing16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Priority',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing4),
                  StatusBadge(
                    text: widget.request.priority.displayName,
                    type: widget.request.priority.badgeType,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPurposeAndDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Purpose & Details',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppConstants.spacing8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppConstants.spacing16),
          decoration: BoxDecoration(
            color: AppTheme.backgroundColor,
            borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            border: Border.all(color: AppTheme.borderColor),
          ),
          child: Text(
            widget.request.details,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildNotesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Approval Notes (Optional)',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppConstants.spacing8),
        TextField(
          controller: _notesController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Add any notes or conditions for this approval...',
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
        const SizedBox(height: AppConstants.spacing4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing24),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppTheme.borderColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          const SizedBox(width: AppConstants.spacing12),
          OutlinedButton.icon(
            onPressed: widget.onReject,
            icon: const Icon(LucideIcons.xCircle, size: 16),
            label: const Text('Reject'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.errorColor,
              side: const BorderSide(color: AppTheme.errorColor),
            ),
          ),
          const SizedBox(width: AppConstants.spacing12),
          ElevatedButton.icon(
            onPressed: widget.onApprove,
            icon: const Icon(LucideIcons.checkCircle, size: 16),
            label: const Text('Approve & Forward'),
          ),
        ],
      ),
    );
  }
}