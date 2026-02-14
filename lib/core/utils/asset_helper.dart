import 'package:flutter/material.dart';

class AssetHelper {
  // Base paths
  static const String _lightImagesPath = 'assets/images/light/';
  static const String _darkImagesPath = 'assets/images/dark/';
  static const String _lottiePath = 'assets/lottie/';
  static const String _audioPath = 'assets/audio/';

  // Get theme-aware image path
  static String getThemedImage(BuildContext context, String imageName) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark
        ? '$_darkImagesPath$imageName'
        : '$_lightImagesPath$imageName';
  }

  // Get light image path
  static String getLightImage(String imageName) {
    return '$_lightImagesPath$imageName';
  }

  // Get dark image path
  static String getDarkImage(String imageName) {
    return '$_darkImagesPath$imageName';
  }

  // Get lottie animation path
  static String getLottie(String fileName) {
    return '$_lottiePath$fileName';
  }

  // Get audio file path
  static String getAudio(String fileName) {
    return '$_audioPath$fileName';
  }
}
