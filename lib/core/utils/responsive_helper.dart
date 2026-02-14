import 'package:flutter/material.dart';
import '../constants/app_dimensions.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppDimensions.mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppDimensions.mobileBreakpoint &&
        width < AppDimensions.desktopBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppDimensions.desktopBreakpoint;
  }

  static double getResponsivePadding(BuildContext context) {
    if (isMobile(context)) {
      return AppDimensions.paddingMedium;
    } else if (isTablet(context)) {
      return AppDimensions.paddingLarge;
    } else {
      return AppDimensions.paddingXLarge;
    }
  }

  static double getResponsiveFontSize(
    BuildContext context,
    double baseFontSize,
  ) {
    if (isMobile(context)) {
      return baseFontSize;
    } else if (isTablet(context)) {
      return baseFontSize * 1.1;
    } else {
      return baseFontSize * 1.2;
    }
  }

  static double getMaxContentWidth(BuildContext context) {
    if (isMobile(context)) {
      return MediaQuery.of(context).size.width;
    } else {
      return AppDimensions.maxContentWidth;
    }
  }
}
