import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class ChipButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final double width;
  final double height;

  const ChipButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.width = 60,
    this.height = 43,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isSelected
              ? (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.accentOrange.withValues(
                        alpha: 0.2,
                      ) // Increased opacity in dark mode
                    : AppColors.accentOrange.withValues(alpha: 0.1))
              : (Theme.of(context).brightness == Brightness.dark
                    ? AppColors
                          .darkChipBackground // #141414 in dark mode
                    : AppColors.borderSubtle), // #F5F5F5 in light mode
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected
                ? AppColors.accentOrange
                : (Theme.of(context).brightness == Brightness.dark
                      ? AppColors
                            .darkChipBorder // #292929 in dark mode
                      : AppColors.borderSubtle), // #F5F5F5 in light mode
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: isSelected
                ? AppTextStyles.chipSelected(context)
                : AppTextStyles.chipUnselected(context),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
