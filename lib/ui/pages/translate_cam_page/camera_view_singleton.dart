import 'dart:ui';

/// Singleton to record size related data
class CameraViewSingleton {
  static double ratio = 1;
  static Size screenSize = Size(411, 957);
  static Size inputImageSize = Size(300, 300);
  static Size get actualPreviewSize =>
      Size(screenSize.width, screenSize.width * ratio);
}
