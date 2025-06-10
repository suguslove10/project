import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/presentation/widgets/metric_card.dart';
import '../../../../shared/presentation/widgets/status_badge.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: AppConstants.spacing24),
          _buildMetricsGrid(context),
          const SizedBox(height: AppConstants.spacing32),
          _buildChartsSection(context),
          const SizedBox(height: AppConstants.spacing32),
          _buildDepartmentAnalysis(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Manager Dashboard',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.spacing8),
        Text(
          'Overview of travel requests and employee data',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 768;
        final crossAxisCount = isTablet ? 4 : 2;
        
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: AppConstants.spacing16,
          mainAxisSpacing: AppConstants.spacing16,
          childAspectRatio: isTablet ? 1.2 : 1.5,
          children: [
            MetricCard(
              title: 'Total Requests',
              value: '367',
              subtitle: '+12% from last month',
              icon: LucideIcons.users,
              borderColor: AppTheme.primaryColor,
            ),
            MetricCard(
              title: 'Approved',
              value: '311',
              subtitle: '84.7% approval rate',
              icon: LucideIcons.checkCircle,
              borderColor: AppTheme.primaryColor,
            ),
            MetricCard(
              title: 'Pending',
              value: '44',
              subtitle: 'Awaiting review',
              icon: LucideIcons.clock,
              borderColor: AppTheme.secondaryColor,
            ),
            MetricCard(
              title: 'Rejected',
              value: '12',
              subtitle: 'This month',
              icon: LucideIcons.xCircle,
              borderColor: AppTheme.secondaryColor,
            ),
          ],
        );
      },
    );
  }

  Widget _buildChartsSection(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 768;
        
        if (isTablet) {
          return Row(
            children: [
              Expanded(child: _buildMonthlyTrendsChart(context)),
              const SizedBox(width: AppConstants.spacing24),
              Expanded(child: _buildStatusDistributionChart(context)),
            ],
          );
        } else {
          return Column(
            children: [
              _buildMonthlyTrendsChart(context),
              const SizedBox(height: AppConstants.spacing24),
              _buildStatusDistributionChart(context),
            ],
          );
        }
      },
    );
  }

  Widget _buildMonthlyTrendsChart(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  LucideIcons.trendingUp,
                  size: 20,
                  color: AppTheme.primaryColor,
                ),
                const SizedBox(width: AppConstants.spacing8),
                Text(
                  'Monthly Request Trends',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacing24),
            SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 20,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: AppTheme.borderColor,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.textSecondary,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                          if (value.toInt() >= 0 && value.toInt() < months.length) {
                            return Text(
                              months[value.toInt()],
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppTheme.textSecondary,
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 45),
                        FlSpot(1, 52),
                        FlSpot(2, 61),
                        FlSpot(3, 58),
                        FlSpot(4, 67),
                        FlSpot(5, 72),
                      ],
                      isCurved: true,
                      color: AppTheme.primaryColor,
                      barWidth: 3,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppTheme.primaryColor.withOpacity(0.1),
                      ),
                    ),
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 38),
                        FlSpot(1, 44),
                        FlSpot(2, 55),
                        FlSpot(3, 50),
                        FlSpot(4, 59),
                        FlSpot(5, 65),
                      ],
                      isCurved: true,
                      color: AppTheme.primaryColor.withOpacity(0.7),
                      barWidth: 2,
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusDistributionChart(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Request Status Distribution',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppConstants.spacing24),
            SizedBox(
              height: 300,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 311,
                      title: 'Approved\n85%',
                      color: AppTheme.primaryColor,
                      radius: 100,
                      titleStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      value: 44,
                      title: 'Pending\n12%',
                      color: AppTheme.secondaryColor,
                      radius: 100,
                      titleStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    PieChartSectionData(
                      value: 12,
                      title: 'Rejected\n3%',
                      color: AppTheme.errorColor,
                      radius: 100,
                      titleStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  centerSpaceRadius: 0,
                  sectionsSpace: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDepartmentAnalysis(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  LucideIcons.calendar,
                  size: 20,
                  color: AppTheme.primaryColor,
                ),
                const SizedBox(width: AppConstants.spacing8),
                Text(
                  'Requests by Department',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacing24),
            SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 25,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: AppTheme.borderColor,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.textSecondary,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const departments = ['Sales', 'Marketing', 'Engineering', 'HR', 'Finance'];
                          if (value.toInt() >= 0 && value.toInt() < departments.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                departments[value.toInt()],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.textSecondary,
                                ),
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 89, color: AppTheme.primaryColor, width: 20)]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 76, color: AppTheme.primaryColor, width: 20)]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 124, color: AppTheme.primaryColor, width: 20)]),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 45, color: AppTheme.primaryColor, width: 20)]),
                    BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 33, color: AppTheme.primaryColor, width: 20)]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}