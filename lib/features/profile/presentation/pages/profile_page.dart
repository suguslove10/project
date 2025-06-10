import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/presentation/widgets/status_badge.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: AppConstants.spacing24),
          LayoutBuilder(
            builder: (context, constraints) {
              final isTablet = constraints.maxWidth >= 768;
              
              if (isTablet) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: _buildProfileCard(context),
                    ),
                    const SizedBox(width: AppConstants.spacing24),
                    Expanded(
                      child: _buildAccountInformation(context),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildProfileCard(context),
                    const SizedBox(height: AppConstants.spacing24),
                    _buildAccountInformation(context),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Profile',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppConstants.spacing8),
              Text(
                'Manage your account information and preferences',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Handle edit profile
          },
          icon: const Icon(LucideIcons.edit, size: 16),
          label: const Text('Edit Profile'),
        ),
      ],
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: AppTheme.primaryColor,
              child: const Text(
                'JM',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: AppConstants.spacing16),
            Text(
              'John Manager',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppConstants.spacing4),
            Text(
              'Travel Manager',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: AppConstants.spacing12),
            const StatusBadge(
              text: 'Manager',
              type: BadgeType.primary,
              icon: LucideIcons.shield,
            ),
            const SizedBox(height: AppConstants.spacing24),
            _buildContactInfo(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      children: [
        _buildContactItem(
          context,
          LucideIcons.mail,
          'john.manager@tsl.com',
        ),
        const SizedBox(height: AppConstants.spacing12),
        _buildContactItem(
          context,
          LucideIcons.phone,
          '+1 (555) 123-4567',
        ),
        const SizedBox(height: AppConstants.spacing12),
        _buildContactItem(
          context,
          LucideIcons.mapPin,
          'New York, NY',
        ),
        const SizedBox(height: AppConstants.spacing12),
        _buildContactItem(
          context,
          LucideIcons.calendar,
          'Joined March 2022',
        ),
      ],
    );
  }

  Widget _buildContactItem(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppTheme.textMuted,
        ),
        const SizedBox(width: AppConstants.spacing12),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildAccountInformation(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Information',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppConstants.spacing8),
            Text(
              'Your personal and professional details',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: AppConstants.spacing24),
            _buildPersonalDetails(context),
            const SizedBox(height: AppConstants.spacing32),
            _buildEmergencyContact(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalDetails(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 600;
        
        return Column(
          children: [
            if (isWide)
              Row(
                children: [
                  Expanded(child: _buildInfoField(context, 'First Name', 'John')),
                  const SizedBox(width: AppConstants.spacing24),
                  Expanded(child: _buildInfoField(context, 'Last Name', 'Manager')),
                ],
              )
            else
              Column(
                children: [
                  _buildInfoField(context, 'First Name', 'John'),
                  const SizedBox(height: AppConstants.spacing16),
                  _buildInfoField(context, 'Last Name', 'Manager'),
                ],
              ),
            const SizedBox(height: AppConstants.spacing16),
            if (isWide)
              Row(
                children: [
                  Expanded(child: _buildInfoField(context, 'Employee ID', 'TSL-2022-001')),
                  const SizedBox(width: AppConstants.spacing24),
                  Expanded(child: _buildInfoField(context, 'Department', 'Travel Management')),
                ],
              )
            else
              Column(
                children: [
                  _buildInfoField(context, 'Employee ID', 'TSL-2022-001'),
                  const SizedBox(height: AppConstants.spacing16),
                  _buildInfoField(context, 'Department', 'Travel Management'),
                ],
              ),
            const SizedBox(height: AppConstants.spacing16),
            if (isWide)
              Row(
                children: [
                  Expanded(child: _buildInfoField(context, 'Position', 'Senior Travel Manager')),
                  const SizedBox(width: AppConstants.spacing24),
                  Expanded(child: _buildInfoField(context, 'Reporting To', 'Sarah Director')),
                ],
              )
            else
              Column(
                children: [
                  _buildInfoField(context, 'Position', 'Senior Travel Manager'),
                  const SizedBox(height: AppConstants.spacing16),
                  _buildInfoField(context, 'Reporting To', 'Sarah Director'),
                ],
              ),
          ],
        );
      },
    );
  }

  Widget _buildEmergencyContact(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Emergency Contact',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppConstants.spacing16),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 600;
            
            return Column(
              children: [
                if (isWide)
                  Row(
                    children: [
                      Expanded(child: _buildInfoField(context, 'Name', 'Jane Manager')),
                      const SizedBox(width: AppConstants.spacing24),
                      Expanded(child: _buildInfoField(context, 'Relationship', 'Spouse')),
                    ],
                  )
                else
                  Column(
                    children: [
                      _buildInfoField(context, 'Name', 'Jane Manager'),
                      const SizedBox(height: AppConstants.spacing16),
                      _buildInfoField(context, 'Relationship', 'Spouse'),
                    ],
                  ),
                const SizedBox(height: AppConstants.spacing16),
                if (isWide)
                  Row(
                    children: [
                      Expanded(child: _buildInfoField(context, 'Phone', '+1 (555) 987-6543')),
                      const SizedBox(width: AppConstants.spacing24),
                      Expanded(child: _buildInfoField(context, 'Email', 'jane.manager@email.com')),
                    ],
                  )
                else
                  Column(
                    children: [
                      _buildInfoField(context, 'Phone', '+1 (555) 987-6543'),
                      const SizedBox(height: AppConstants.spacing16),
                      _buildInfoField(context, 'Email', 'jane.manager@email.com'),
                    ],
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildInfoField(BuildContext context, String label, String value) {
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
}