import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../widgets/employee_card.dart';
import '../widgets/upcoming_trips_dialog.dart';
import '../../domain/models/employee.dart';

class EmployeeInfoPage extends ConsumerWidget {
  const EmployeeInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employees = _getEmployees();
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: AppConstants.spacing24),
          _buildEmployeesList(context, employees),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employee Travel Information',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.spacing8),
        Text(
          'Monitor current and upcoming employee travel',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildEmployeesList(BuildContext context, List<Employee> employees) {
    return Column(
      children: employees.map((employee) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppConstants.spacing24),
          child: EmployeeCard(
            employee: employee,
            onViewUpcomingTrips: () => _showUpcomingTrips(context, employee),
          ),
        );
      }).toList(),
    );
  }

  void _showUpcomingTrips(BuildContext context, Employee employee) {
    showDialog(
      context: context,
      builder: (context) => UpcomingTripsDialog(employee: employee),
    );
  }

  List<Employee> _getEmployees() {
    return [
      Employee(
        id: '1',
        name: 'John Smith',
        department: 'Sales',
        email: 'john.smith@tsl.com',
        totalTrips: 15,
        currentTrip: Trip(
          destination: 'London, UK',
          startDate: DateTime(2024, 6, 15),
          endDate: DateTime(2024, 6, 18),
          purpose: 'Client meeting',
          budget: 2500,
          status: TripStatus.active,
        ),
        upcomingTrips: [
          Trip(
            destination: 'Berlin, Germany',
            startDate: DateTime(2024, 7, 20),
            endDate: DateTime(2024, 7, 23),
            purpose: 'Client meeting',
            budget: 1800,
            status: TripStatus.scheduled,
          ),
          Trip(
            destination: 'Milan, Italy',
            startDate: DateTime(2024, 8, 15),
            endDate: DateTime(2024, 8, 18),
            purpose: 'Trade show',
            budget: 2200,
            status: TripStatus.scheduled,
          ),
        ],
      ),
      Employee(
        id: '2',
        name: 'Sarah Johnson',
        department: 'Marketing',
        email: 'sarah.j@tsl.com',
        totalTrips: 8,
        upcomingTrips: [
          Trip(
            destination: 'Barcelona, Spain',
            startDate: DateTime(2024, 7, 10),
            endDate: DateTime(2024, 7, 12),
            purpose: 'Conference',
            budget: 1500,
            status: TripStatus.scheduled,
          ),
        ],
      ),
      Employee(
        id: '3',
        name: 'Mike Chen',
        department: 'Engineering',
        email: 'mike.chen@tsl.com',
        totalTrips: 22,
        currentTrip: Trip(
          destination: 'Tokyo, Japan',
          startDate: DateTime(2024, 6, 12),
          endDate: DateTime(2024, 6, 20),
          purpose: 'Technical conference',
          budget: 4200,
          status: TripStatus.active,
        ),
        upcomingTrips: [],
      ),
      Employee(
        id: '4',
        name: 'Emily Davis',
        department: 'HR',
        email: 'emily.davis@tsl.com',
        totalTrips: 12,
        upcomingTrips: [
          Trip(
            destination: 'Amsterdam, Netherlands',
            startDate: DateTime(2024, 7, 5),
            endDate: DateTime(2024, 7, 7),
            purpose: 'HR Summit',
            budget: 1200,
            status: TripStatus.scheduled,
          ),
          Trip(
            destination: 'Zurich, Switzerland',
            startDate: DateTime(2024, 8, 1),
            endDate: DateTime(2024, 8, 3),
            purpose: 'Training',
            budget: 1800,
            status: TripStatus.scheduled,
          ),
          Trip(
            destination: 'Stockholm, Sweden',
            startDate: DateTime(2024, 9, 10),
            endDate: DateTime(2024, 9, 12),
            purpose: 'Workshop',
            budget: 1600,
            status: TripStatus.scheduled,
          ),
        ],
      ),
    ];
  }
}