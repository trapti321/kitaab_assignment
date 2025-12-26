import 'size_utils.dart';

extension RadiusPercentExtension on num {
  // Responsive radius based on screen width percentage
  double get r => this * SizeConfig.blockWidth;
}
