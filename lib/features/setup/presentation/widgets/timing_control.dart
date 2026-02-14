import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class TimingControl extends StatelessWidget {
  final String label;
  final int duration;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final int minDuration;
  final int maxDuration;

  const TimingControl({
    super.key,
    required this.label,
    required this.duration,
    required this.onIncrement,
    required this.onDecrement,
    this.minDuration = 2,
    this.maxDuration = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.only(top: 11, right: 7, bottom: 11, left: 7),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors
                  .darkChipBackground // #141414 in dark mode
            : AppColors.timingBackground, // #F7F7F7 in light mode
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors
                    .darkChipBorder // #292929 in dark mode
              : AppColors.timingBorder, // #E5E5E5 in light mode
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side - Label
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(label, style: AppTextStyles.phaseLabel(context)),
          ),

          // Right side - Controls
          Row(
            children: [
              // Minus button
              GestureDetector(
                onTap: onDecrement,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors
                              .darkTimingButtonBg // #424242 in dark mode
                        : AppColors.lightBackground, // Light in light mode
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      '−',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppColors.primaryText,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Duration text
              SizedBox(
                width: 32,
                child: Center(
                  child: Text(
                    '${duration}s',
                    style: AppTextStyles.durationText(context),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Plus button
              GestureDetector(
                onTap: onIncrement,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors
                              .darkTimingButtonBg // #424242 in dark mode
                        : AppColors.lightBackground, // Light in light mode
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppColors.primaryText,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
