import 'package:flutter/widgets.dart';

class Responsive {
  static bool isMobile(BuildContext ctx) => MediaQuery.of(ctx).size.width < 600;
  static bool isTablet(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width >= 600 &&
      MediaQuery.of(ctx).size.width < 1024;
  static bool isDesktop(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width >= 1024;

  //Returns a constrained max width for content on large screens

  static double contentMaxWidth(BuildContext ctx) {
    final w = MediaQuery.of(ctx).size.width;
    if (w >= 1440) return 1200;
    if (w >= 1024) return 920;
    if (w >= 720) return 720;
    return w;
  }

  /// Scales a base size relative to width (useful for fonts/paddings)
  static double scaleWidth(BuildContext ctx, double base) {
    final w = MediaQuery.of(ctx).size.width;
    // reference width = 375 (typical mobile)
    return base * (w / 375).clamp(0.8, 2.0);
  }
}
