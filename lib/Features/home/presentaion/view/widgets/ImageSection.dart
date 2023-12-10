import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../Core/Utils/Responsive.dart';

class ImageSection extends StatelessWidget {
  final List<String> imageList;
  final int index;

  ImageSection({required this.imageList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      height: MediaQueryHelper.sizeFromHeight(context, 3.5),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(imageList[index]),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
          ),
        ),
      ),
    );
  }
}



