import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../shared/widgets/responsive_layout.dart';
import '../../../setup/domain/models/breathing_settings.dart';

class BreathingCompleteScreen extends StatelessWidget {
  const BreathingCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the settings from the previous screen if available
    final settings =
        ModalRoute.of(context)?.settings.arguments as BreathingSettings?;

    return Scaffold(
      body: ResponsiveLayout(
        showCloseButton: true,
        onClose: () {
          // Navigate back to setup screen
          Navigator.popUntil(context, (route) => route.isFirst);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lottie Animation
                LottieBuilder.asset(
                  'assets/lottie/well_done.json',
                  width: 196,
                  height: 196,
                  fit: BoxFit.contain,
                  repeat: false,
                ),

                const SizedBox(height: 24),

                // Celebration Title
                Text(
                  'You did it! 🎉',
                  style: AppTextStyles.celebrationTitle(context),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Subtitle
                Text(
                  'Great rounds of calm, just like that. Your mind thanks you.',
                  style: AppTextStyles.completionSubtitle(context),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                // Start Breathing Again Button
                SizedBox(
                  width: 271,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back to breathing exercise with same settings
                      if (settings != null) {
                        Navigator.pushReplacementNamed(
                          context,
                          '/breathing-exercise',
                          arguments: settings,
                        );
                      } else {
                        // If no settings, go back to setup
                        Navigator.popUntil(context, (route) => route.isFirst);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkSwitchThumbColor
                          : AppColors.switchThumbColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start breathing',
                          style: AppTextStyles.startButton(context),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          'assets/images/common/wind.svg',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Back to Setup Button
                SizedBox(
                  width: 197,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back to setup screen
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.backButtonBg,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                    ),
                    child: Text(
                      'Back to set up',
                      style: AppTextStyles.backButtonText(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
