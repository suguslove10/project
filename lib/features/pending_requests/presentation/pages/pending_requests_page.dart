import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/presentation/widgets/status_badge.dart';
import '../widgets/request_card.dart';
import '../widgets/request_details_dialog.dart';
import '../../domain/models/travel_request.dart';

class PendingRequestsPage extends ConsumerStatefulWidget {
  const PendingRequestsPage({super.key});

  @override
  ConsumerState<PendingRequestsPage> createState() => _PendingRequestsPageState();
}

class _PendingRequestsPageState extends ConsumerState<PendingRequestsPage> {
  List<TravelRequest> _pendingRequests = [
    TravelRequest(
      id: '1',
      employeeName: 'David Kim',
      department: 'Sales',
      destination: 'Paris, France',
      purpose: 'Client presentation and contract negotiation',
      startDate: DateTime(2024, 7, 1),
      endDate: DateTime(2024, 7, 5),
      estimatedCost: 2800,
      priority: RequestPriority.high,
      submittedDate: DateTime(2024, 6, 8),
      details: 'Important client meeting to finalize Q3 partnership agreement. Required for revenue targets.',
      status: RequestStatus.pending,
    ),
    TravelRequest(
      id: '2',
      employeeName: 'Lisa Rodriguez',
      department: 'Marketing',
      destination: 'Barcelona, Spain',
      purpose: 'Industry conference and networking',
      startDate: DateTime(2024, 7, 15),
      endDate: DateTime(2024, 7, 18),
      estimatedCost: 2200,
      priority: RequestPriority.medium,
      submittedDate: DateTime(2024, 6, 9),
      details: 'Annual marketing conference with key industry leaders. Opportunity for brand partnerships.',
      status: RequestStatus.pending,
    ),
    TravelRequest(
      id: '3',
      employeeName: 'James Thompson',
      department: 'Engineering',
      destination: 'Singapore',
      purpose: 'Technical training and certification',
      startDate: DateTime(2024, 8, 5),
      endDate: DateTime(2024, 8, 12),
      estimatedCost: 4500,
      priority: RequestPriority.low,
      submittedDate: DateTime(2024, 6, 10),
      details: 'Advanced cloud architecture certification program. Will enhance team capabilities.',
      status: RequestStatus.pending,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: AppConstants.spacing24),
          if (_pendingRequests.isEmpty)
            _buildEmptyState(context)
          else
            _buildRequestsList(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pending Requests',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.spacing8),
        Text(
          'Review and approve employee travel requests',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
        const SizedBox(height: AppConstants.spacing16),
        StatusBadge(
          text: '${_pendingRequests.length} requests pending review',
          type: BadgeType.info,
          icon: LucideIcons.clock,
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing32),
        child: Center(
          child: Column(
            children: [
              Icon(
                LucideIcons.checkCircle,
                size: 64,
                color: AppTheme.primaryColor,
              ),
              const SizedBox(height: AppConstants.spacing16),
              Text(
                'No Pending Requests',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppConstants.spacing8),
              Text(
                'All travel requests have been processed. Great job!',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRequestsList(BuildContext context) {
    return Column(
      children: _pendingRequests.map((request) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppConstants.spacing16),
          child: RequestCard(
            request: request,
            onViewDetails: () => _showRequestDetails(context, request),
            onApprove: () => _approveRequest(request),
            onReject: () => _rejectRequest(request),
          ),
        );
      }).toList(),
    );
  }

  void _showRequestDetails(BuildContext context, TravelRequest request) {
    showDialog(
      context: context,
      builder: (context) => RequestDetailsDialog(
        request: request,
        onApprove: () => _approveRequest(request),
        onReject: () => _rejectRequest(request),
      ),
    );
  }

  void _approveRequest(TravelRequest request) {
    setState(() {
      _pendingRequests.removeWhere((r) => r.id == request.id);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Request approved and forwarded to TSL Administration.'),
        backgroundColor: AppTheme.successColor,
      ),
    );
    
    Navigator.of(context).pop(); // Close dialog if open
  }

  void _rejectRequest(TravelRequest request) {
    setState(() {
      _pendingRequests.removeWhere((r) => r.id == request.id);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Request rejected and removed from the list.'),
        backgroundColor: AppTheme.errorColor,
      ),
    );
    
    Navigator.of(context).pop(); // Close dialog if open
  }
}