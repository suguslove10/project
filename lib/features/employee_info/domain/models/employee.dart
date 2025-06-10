import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  final String id;
  final String name;
  final String department;
  final String email;
  final int totalTrips;
  final Trip? currentTrip;
  final List<Trip> upcomingTrips;

  Employee({
    required this.id,
    required this.name,
    required this.department,
    required this.email,
    required this.totalTrips,
    this.currentTrip,
    this.upcomingTrips = const [],
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  String get initials {
    final names = name.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '';
  }
}

@JsonSerializable()
class Trip {
  final String destination;
  final DateTime startDate;
  final DateTime endDate;
  final String purpose;
  final double budget;
  final TripStatus status;

  Trip({
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.purpose,
    required this.budget,
    required this.status,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);
}

enum TripStatus {
  @JsonValue('scheduled')
  scheduled,
  @JsonValue('active')
  active,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}

extension TripStatusExtension on TripStatus {
  String get displayName {
    switch (this) {
      case TripStatus.scheduled:
        return 'Scheduled';
      case TripStatus.active:
        return 'Active';
      case TripStatus.completed:
        return 'Completed';
      case TripStatus.cancelled:
        return 'Cancelled';
    }
  }
}