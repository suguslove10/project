import 'package:json_annotation/json_annotation.dart';

part 'travel_request.g.dart';

@JsonSerializable()
class TravelRequest {
  final String id;
  final String employeeName;
  final String department;
  final String destination;
  final String purpose;
  final DateTime startDate;
  final DateTime endDate;
  final double estimatedCost;
  final RequestPriority priority;
  final DateTime submittedDate;
  final String details;
  final RequestStatus status;

  TravelRequest({
    required this.id,
    required this.employeeName,
    required this.department,
    required this.destination,
    required this.purpose,
    required this.startDate,
    required this.endDate,
    required this.estimatedCost,
    required this.priority,
    required this.submittedDate,
    required this.details,
    required this.status,
  });

  factory TravelRequest.fromJson(Map<String, dynamic> json) =>
      _$TravelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TravelRequestToJson(this);
}

enum RequestPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
}

enum RequestStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('approved')
  approved,
  @JsonValue('rejected')
  rejected,
  @JsonValue('completed')
  completed,
}

extension RequestPriorityExtension on RequestPriority {
  String get displayName {
    switch (this) {
      case RequestPriority.low:
        return 'Low';
      case RequestPriority.medium:
        return 'Medium';
      case RequestPriority.high:
        return 'High';
    }
  }

  BadgeType get badgeType {
    switch (this) {
      case RequestPriority.low:
        return BadgeType.secondary;
      case RequestPriority.medium:
        return BadgeType.warning;
      case RequestPriority.high:
        return BadgeType.error;
    }
  }
}

extension RequestStatusExtension on RequestStatus {
  String get displayName {
    switch (this) {
      case RequestStatus.pending:
        return 'Pending';
      case RequestStatus.approved:
        return 'Approved';
      case RequestStatus.rejected:
        return 'Rejected';
      case RequestStatus.completed:
        return 'Completed';
    }
  }

  BadgeType get badgeType {
    switch (this) {
      case RequestStatus.pending:
        return BadgeType.warning;
      case RequestStatus.approved:
        return BadgeType.success;
      case RequestStatus.rejected:
        return BadgeType.error;
      case RequestStatus.completed:
        return BadgeType.primary;
    }
  }
}

// Import for BadgeType
import '../../../../shared/presentation/widgets/status_badge.dart';