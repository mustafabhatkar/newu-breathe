import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newu_breathe/core/constants/app_colors.dart';

class AppTextStyles {
  // Heading Styles
  static TextStyle heading1(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Theme.of(context).colorScheme.onBackground,
  );

  static TextStyle heading2(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Theme.of(context).colorScheme.onBackground,
  );

  static TextStyle heading3(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onBackground,
  );

  static TextStyle heading4(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onBackground,
  );

  // Body Styles
  static TextStyle bodyLarge(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onBackground,
  );

  static TextStyle bodyMedium(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onBackground,
  );

  static TextStyle bodySmall(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onBackground,
  );

  // Button Styles
  static TextStyle button(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onPrimary,
  );

  static TextStyle buttonLarge(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Theme.of(context).colorScheme.onPrimary,
  );

  // Caption Styles
  static TextStyle caption(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
  );

  static TextStyle captionBold(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
  );

  // Setup Screen Specific Styles

  // Font/Size/2xl - Bold - 150% line height
  static TextStyle heading2xl(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.5,
    color: Theme.of(context).colorScheme.onBackground,
  );

  // Font/Size/sm - Regular - 150% line height
  static TextStyle bodySmRegular(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: Theme.of(context).colorScheme.onBackground,
  );

  // Section Title - 15px SemiBold
  static TextStyle sectionTitle(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFFFFFFF) // White in dark mode
        : const Color(0xFF141414), // Dark in light mode
  );

  // Section Subtitle - 12px Regular (Lato)
  static TextStyle sectionSubtitle(BuildContext context) => GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFA3A3A3) // Light gray in dark mode
        : const Color(0xFF737373), // Medium gray in light mode
  );

  // Chip Button Unselected - 14px Regular
  static TextStyle chipUnselected(BuildContext context) =>
      GoogleFonts.quicksand(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: Theme.of(context).colorScheme.onBackground,
      );

  // Chip Button Selected - 14px SemiBold
  static TextStyle chipSelected(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: AppColors.accentOrange,
  );

  // Advanced Timing Phase Label - Font/Size/sm SemiBold
  static TextStyle phaseLabel(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : const Color(0xFF141414),
  );

  // Duration Text - Font/Size/lg Regular (Lato)
  static TextStyle durationText(BuildContext context) => GoogleFonts.lato(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : const Color(0xFF141414),
  );

  // Start Button Text - 16px SemiBold
  static TextStyle startButton(BuildContext context) => GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.5,
    color: Colors.white,
  );

  // Breathing Exercise Styles

  // Countdown Text - 36px Bold
  static TextStyle countdownText(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    height: 1.0,
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : const Color(0xFF141414),
  );

  // Phase Label - 36px Bold (Get ready, Breathe in, etc.)
  static TextStyle phaseMainLabel(BuildContext context) =>
      GoogleFonts.quicksand(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        height: 1.0,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xFF141414),
      );

  // Phase Subtitle - 14px Regular
  static TextStyle phaseSubtitle(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: const Color(0xFF737373),
  );

  // Cycle Info Text - 12px Regular
  static TextStyle cycleInfo(BuildContext context) => GoogleFonts.quicksand(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : const Color(0xFF630068),
  );

  // Encouragement Text - 13px Italic
  static TextStyle encouragementText(BuildContext context) => GoogleFonts.lato(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.5,
    color: const Color(0xFF737373),
  );

  // Pause Button Text - Font/Size/base Bold
  static TextStyle pauseButtonText(BuildContext context) => GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.5,
    color: AppColors.pauseButtonText,
  );

  // Completion Screen Styles

  // Celebration Title - Font/Size/2xl SemiBold
  static TextStyle celebrationTitle(BuildContext context) =>
      GoogleFonts.quicksand(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xFF141414),
        textBaseline: TextBaseline.alphabetic,
      );

  // Completion Subtitle - Font/Size/sm Regular
  static TextStyle completionSubtitle(BuildContext context) =>
      GoogleFonts.quicksand(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: const Color(0xFF737373),
        textBaseline: TextBaseline.alphabetic,
      );

  // Back Button Text - Font/Size/base Bold
  static TextStyle backButtonText(BuildContext context) => GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.5,
    color: const Color(0xFF141414),
  );
}
