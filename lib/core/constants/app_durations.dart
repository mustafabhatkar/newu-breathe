class AppDurations {
  // Animation Durations
  static const Duration short = Duration(milliseconds: 200);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration long = Duration(milliseconds: 500);
  static const Duration xLong = Duration(milliseconds: 800);

  // Breathing Phase Durations (default values)
  static const Duration defaultInhale = Duration(seconds: 4);
  static const Duration defaultHold = Duration(seconds: 4);
  static const Duration defaultExhale = Duration(seconds: 4);
  static const Duration defaultRest = Duration(seconds: 4);

  // UI Feedback Durations
  static const Duration snackBar = Duration(seconds: 3);
  static const Duration splash = Duration(seconds: 2);
}
