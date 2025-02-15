import 'size_config.dart';

extension SizeExtension on num {
  // Height
  double get h => SizeConfig.h(this.toDouble());
  
  // Width
  double get w => SizeConfig.w(this.toDouble());
  
  // Font Size
  double get sp => SizeConfig.sp(this.toDouble());
  
  // Padding/Margin
  double get p => SizeConfig.p(this.toDouble());
}
