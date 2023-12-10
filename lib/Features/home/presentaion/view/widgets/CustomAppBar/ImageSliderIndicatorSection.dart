import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../Core/Utils/App Colors.dart';

class ImageSliderIndicatorSection extends StatelessWidget {
  final PageController controller;
  final int length;

  ImageSliderIndicatorSection({required this.controller, required this.length});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: SmoothPageIndicator(
        controller: controller,
        count: length,
        effect: const WormEffect(
          radius: 20,
          dotHeight: 5,
          dotWidth: 20,
          activeDotColor: AppColors.primaryColor,
          dotColor: AppColors.mediumGrey,
        ),
      ),
    );
  }
}