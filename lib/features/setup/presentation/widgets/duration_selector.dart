import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';

class DurationSelector extends StatelessWidget {
  final String label;
  final int value;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;
  final String unit;

  const DurationSelector({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.minValue = 1,
    this.maxValue = 10,
    this.unit = 'sec',
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: colorScheme.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.bodyMedium(
              context,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppDimensions.paddingSmall),
          Row(
            children: [
              // Decrease Button
              _buildControlButton(
                context,
                icon: Icons.remove,
                onPressed: value > minValue ? () => onChanged(value - 1) : null,
              ),
              const SizedBox(width: AppDimensions.paddingMedium),
              // Value Display
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.paddingSmall,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusSmall,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$value $unit',
                      style: AppTextStyles.heading3(context).copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppDimensions.paddingMedium),
              // Increase Button
              _buildControlButton(
                context,
                icon: Icons.add,
                onPressed: value < maxValue ? () => onChanged(value + 1) : null,
              ),
            ],
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

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: onPressed != null
            ? LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.primary.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: onPressed == null
            ? colorScheme.onBackground.withOpacity(0.1)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingSmall),
            child: Icon(
              icon,
              color: onPressed != null
                  ? colorScheme.onPrimary
                  : colorScheme.onBackground.withOpacity(0.3),
              size: AppDimensions.iconMedium,
            ),
          ),
        ),
      ),
    );
  }
}
