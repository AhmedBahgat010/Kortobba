import 'package:flutter/cupertino.dart';

import '../../App Colors.dart';
import 'SpinKitDoubleBounce.dart';
import 'SpinKitThreeBounce.dart';

enum LoadingType {
  threeBounce,
  doubleBounce,
}

class LoadingWidget extends StatelessWidget {
  final LoadingType type;
  final Color color;
  final double size;

  const LoadingWidget({
    super.key,
    this.type = LoadingType.doubleBounce,
    this.color = AppColors.greenYellow,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      LoadingType.threeBounce => SpinKitThreeBounce(
        color: color,
        size: size,
      ),
      LoadingType.doubleBounce => SpinKitDoubleBounce(
        color: color,
        size: size,
      ),
    };
  }
}