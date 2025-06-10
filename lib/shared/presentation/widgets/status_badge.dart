import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';

enum BadgeType {
  primary,
  secondary,
  success,
  warning,
  error,
  info,
}

class StatusBadge extends StatelessWidget {
  final String text;
  final BadgeType type;
  final IconData? icon;

  const StatusBadge({
    super.key,
    required this.text,
    this.type = BadgeType.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = _getColors(type);
    
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacing8,
        vertical: AppConstants.spacing4,
      ),
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        border: Border.all(color: colors.borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 12,
              color: colors.textColor,
            ),
            const SizedBox(width: AppConstants.spacing4),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: colors.textColor,
            ),
          ),
        ],
      ),
    );
  }

  _BadgeColors _getColors(BadgeType type) {
    switch (type) {
      case BadgeType.primary:
        return _BadgeColors(
          backgroundColor: AppTheme.primaryColor,
          borderColor: AppTheme.primaryColor,
          textColor: Colors.white,
        );
      case BadgeType.secondary:
        return _BadgeColors(
          backgroundColor: AppTheme.secondaryColor,
          borderColor: AppTheme.borderColor,
          textColor: AppTheme.textSecondary,
        );
      case BadgeType.success:
        return _BadgeColors(
          backgroundColor: AppTheme.successColor,
          borderColor: AppTheme.successColor,
          textColor: Colors.white,
        );
      case BadgeType.warning:
        return _BadgeColors(
          backgroundColor: AppTheme.warningColor,
          borderColor: AppTheme.warningColor,
          textColor: Colors.white,
        );
      case BadgeType.error:
        return _BadgeColors(
          backgroundColor: AppTheme.errorColor,
          borderColor: AppTheme.errorColor,
          textColor: Colors.white,
        );
      case BadgeType.info:
        return _BadgeColors(
          backgroundColor: Colors.blue.shade50,
          borderColor: Colors.blue.shade200,
          textColor: Colors.blue.shade700,
        );
    }
  }
}

class _BadgeColors {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  _BadgeColors({
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
  });
}