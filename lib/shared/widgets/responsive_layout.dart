import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_colors.dart';
import 'theme_switch_button.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget child;

  const ResponsiveLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: isDark
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.darkGradientStart,
                  AppColors.darkGradientMid,
                  AppColors.darkGradientEnd,
                ],
                stops: [0.0, 0.4, 1.0],
              )
            : const LinearGradient(
                // 211.93deg angle: from top-right towards bottom-left
                begin: Alignment(0.5, -1.0),
                end: Alignment(-0.5, 1.0),
                colors: [
                  AppColors.lightGradientStart,
                  AppColors.lightGradientEnd,
                ],
                stops: [0.3121, 0.6944], // 31.21% and 69.44% from Figma
              ),
      ),
      child: Container(
        child: Stack(
          children: [
            // Light Theme Background Images
            if (!isDark) ..._buildLightThemeBackgrounds(),

            // Dark Theme Background Images (TODO)
            if (isDark) ..._buildDarkThemeBackgrounds(),

            // Content
            SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: child,
                ),
              ),
            ),

            // Theme Switch Button (positioned like app bar button)
            const Positioned(top: 52, right: 24, child: ThemeSwitchButton()),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildLightThemeBackgrounds() {
    return [
      // Bottom cloud at the bottom with 8px spacing, edges clipped
      Positioned(
        bottom: 32,
        left: 20,
        // More right clip
        child: SvgPicture.asset(
          'assets/images/light/bottom_cloud.svg',
          fit: BoxFit.cover,
        ),
      ),

      // Med bottom cloud on top with 4px spacing
      Positioned(
        top: 4,
        right: -20,

        child: SvgPicture.asset(
          'assets/images/light/med_bottom_cloud.svg',
          fit: BoxFit.contain,
        ),
      ),

      // Colored cloud on top of med_bottom_cloud with 44px top margin
      Positioned(
        top: 80,
        left: 30,

        child: SvgPicture.asset(
          'assets/images/light/colored_cloud.svg',
          fit: BoxFit.contain,
        ),
      ),

      // Cloud 1 positioned below med_bottom_cloud, right part clipped (2px)
      Positioned(
        top: 150, // Adjust based on med_bottom_cloud height
        right: -8, // Clip 2px on right edge
        child: SvgPicture.asset(
          'assets/images/light/cloud_1.svg',
          fit: BoxFit.contain,
        ),
      ),

      // Cloud 2 below cloud_1 on left side, left edge clipped, 8px spacing
      Positioned(
        top: 230, // Adjust based on cloud_1 position + 8px spacing
        left: -8, // Clip left edge
        child: SvgPicture.asset(
          'assets/images/light/cloud_2.svg',
          fit: BoxFit.contain,
        ),
      ),

      // Cloud 1 repeated below cloud_2 on right, 16px spacing
      Positioned(
        top: 310, // Adjust based on cloud_2 position + 16px spacing
        right: -8, // Clip 2px on right edge
        child: SvgPicture.asset(
          'assets/images/light/cloud_1.svg',
          fit: BoxFit.contain,
        ),
      ),
    ];
  }

  List<Widget> _buildDarkThemeBackgrounds() {
    // TODO: Implement dark theme backgrounds
    return [];
  }
}
