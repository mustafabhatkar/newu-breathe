import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';

class CycleSelector extends StatelessWidget {
  final int value;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;

  const CycleSelector({
    super.key,
    required this.value,
    required this.onChanged,
    this.minValue = 1,
    this.maxValue = 20,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingLarge),
      decoration: BoxDecoration(
        color: colorScheme.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Number of Cycles',
            style: AppTextStyles.heading4(
              context,
            ).copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppDimensions.paddingLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Decrease Button
              _buildControlButton(
                context,
                icon: Icons.remove_circle_outline,
                onPressed: value > minValue ? () => onChanged(value - 1) : null,
              ),
              const SizedBox(width: AppDimensions.paddingXLarge),
              // Value Display
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [colorScheme.primary, colorScheme.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$value',
                    style: AppTextStyles.heading1(context).copyWith(
                      color: colorScheme.onPrimary,
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppDimensions.paddingXLarge),
              // Increase Button
              _buildControlButton(
                context,
                icon: Icons.add_circle_outline,
                onPressed: value < maxValue ? () => onChanged(value + 1) : null,
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.paddingMedium),
          Text(
            'cycles',
            style: AppTextStyles.bodySmall(
              context,
            ).copyWith(color: colorScheme.onBackground.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: AppDimensions.iconXLarge,
      color: onPressed != null
          ? colorScheme.primary
          : colorScheme.onBackground.withOpacity(0.2),
    );
  }
}
